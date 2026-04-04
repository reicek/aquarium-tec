# Electronics And Control

This file describes the preferred electrical architecture for the prototype and the path to a cleaner production-style build.

## Control architecture philosophy

First revision should separate logic and sensing from the high-current TEC power stage.

Recommended split:

- XIAO nRF52840 Plus plus Round Display handle local HMI, BLE telemetry, and core control logic
- custom interface or interposer board handles sensor connectors, conditioned driver signals, power entry, and access to the Plus-only additional pads
- external TEC driver handles 24 V power switching in the first revision

Why:

- lower integration risk
- easier PCBWay assembly
- easier bench debugging
- avoids forcing the first custom PCB to solve both logic and power-stage problems at the same time

## Power tree

Recommended structure:

- 24 V main input from PSU
- direct 24 V branch to TEC driver
- fused low-current 24 V branch to the logic buck
- 24 V to 5 V buck for the XIAO, Round Display, and low-current logic rail
- direct 24 V branch to the current prototype fan
- no 12 V rail in the current exact prototype build; keep a 24 V to 12 V buck only as a fallback if the stock 12 V cooler fan is reinstated later

Important constraint:

- raw 24 V must not be routed to the XIAO Plus or Round Display; the powered prototype must pass through the 24 V to 5 V logic buck first

Practical baseline parts:

- main PSU: Mean Well LRS-350-24, approved project baseline PSU
- logic converter: TOBSUN EA15-5V, required for the powered prototype until the controller board exists
- hot-side fan path: Thermalright Assassin X 120 Refined SE heatsink with a Noctua NF-F12 industrialPPC-24V-2000 IP67 PWM replacement fan
- optional fallback fan converter: Pololu D24V10F12 only if the stock 12 V cooler fan is kept instead of the 24 V Noctua replacement

Logic power budget note:

- the Round Display itself is low power, but the total 5 V budget should assume XIAO, display, sensors, and interface buffer overhead
- a 5 V rail sized for at least 500 mA continuous is comfortable; 1 A is preferred margin

## TEC driver strategy

Approved prototype baseline:

- external IBT-2 Double BTS7960 43A H-bridge module

Current engineering stance:

- approved for the first powered prototype
- not automatically trusted for long-term continuous-duty use

Important issue:

- the XIAO Plus is 3.3 V logic only
- many generic driver modules are sold as 5 V logic accessories
- do not assume logic compatibility without verification

Engineering recommendation:

- either verify the driver input thresholds on the exact module used
- or insert a proper logic-level translator / buffer between XIAO and driver
- the preferred rev-1 solution is a Texas Instruments SN74AHCT125PW powered from 5 V; treat it as standard in rev 1 unless the received IBT-2 board is fully verified for 3.3 V logic and safe defaults

## Control method

Do not use relays for TEC power modulation.

Use:

- transistorized driver stage
- PWM or current-modulated control through the driver

Prototype control notes:

- the TEC does not need polarity reversal for a pure cooling system, but an H-bridge keeps that option available
- if future integration prefers a simpler direction, a one-quadrant power stage could replace the H-bridge later

## Recommended sensors

Recommended rev-1 temperature set:

- one water temperature sensor for actual aquarium temperature control
- one hot-side sensor on the CPU cooler base or near the hot plate
- one cold-block sensor on the exchanger body
- one air intake temperature sensor placed upstream of the cooler fan and used as the ambient intake reference
- one air outlet temperature sensor placed in the cooler exhaust stream

Strongly recommended additional sensors:

- ambient humidity sensor near the insulated block to watch condensation risk
- leak sensor in the cabinet or below the block

Why the extra air sensors are worth adding:

- intake air temperature gives a real ambient baseline for hot-side performance and condensation calculations
- outlet air temperature gives a quick check on heatsink delta and airflow health
- intake-to-outlet trend data helps catch fan failure, fin blockage, or exhaust recirculation earlier than the base sensor alone

Recommended sensor types:

- Adafruit Waterproof DS18B20, PID 381, for water temperature unless the stock probe already on hand is reused
- Analog Devices DS18B20+ in TO-92 package for the hot side
- Analog Devices DS18B20+ in TO-92 package for the cold block
- Analog Devices DS18B20+ in TO-92 package for intake air
- Analog Devices DS18B20+ in TO-92 package for outlet air
- Adafruit SHT31-D breakout, PID 2857, for ambient condensation monitoring
- DFRobot Gravity Water Sensor, SEN0205, as the current exact prototype leak-sensor choice

Rev-1 integration recommendation:

- standardize water, cold-block, hot-side, intake-air, and outlet-air on one shared 1-Wire bus
- DS18B20 is now the chosen rev-1 temperature family for all five points
- exact attachment method for the hot-side and cold-block sensors is still a mechanical packaging detail, but no extra analog temperature channel is planned

Bus-sharing note:

- the Round Display already occupies D4 and D5 for I2C-based RTC and touch functions
- the humidity sensor can still share this I2C bus if pull-ups and address assignments are kept sensible
- a shared DS18B20 bus lets water, cold-block, hot-side, intake-air, and outlet-air probes share a single extra GPIO on the Plus-only pad set
- use the SEN0205 as the current exact leak-sensor part for the dry-build prototype and treat the controller-side channel as a thresholded leak input during harness bring-up

## Safety and fail-safe behaviors

The controller should be designed around fault containment, not just temperature control.

Minimum failsafes:

- if hot-side temperature exceeds threshold, reduce or stop TEC drive
- if water temperature sensor becomes invalid, stop TEC drive and raise alarm
- if hot-side temperature rises while the outlet-air minus intake-air delta collapses, assume airflow trouble and reduce or stop TEC drive
- if intake air temperature is unusually high, derate expected cooling capacity or raise an operator warning
- if humidity rises to condensation-risk levels, limit cooling aggressiveness or alarm
- if leak sensor trips, stop TEC and alarm
- if XIAO watchdog triggers, force the TEC driver to a safe disabled state

Electrical protection recommendations:

- branch fuses
- reverse-polarity protection on the low-current logic input
- TVS or surge protection on external sensor lines if they are long
- pull-down or pull-up states that leave the TEC disabled by default at MCU reset

## XIAO Plus and Round Display architecture

The control subsystem should be treated as an HMI stack plus an interface board, not a bare XIAO dev board.

Preferred architecture:

- U1: Seeed Studio XIAO nRF52840 Plus
- U2: Seeed Studio Round Display for XIAO
- PCB1: custom interface or interposer board assembled by PCBWay
- U3: external TEC driver module in prototype phase

Interface-board purpose:

- mount or interconnect the XIAO Plus cleanly
- preserve or replicate the standard XIAO header geometry needed by the Round Display
- break out the Plus-only additional pads to usable connectors or nets
- provide regulated power distribution
- provide driver interface conditioning
- expose SWD pads and debugging access
- keep antenna area clear

Recommended board philosophy:

- 4-layer FR-4
- ENIG finish
- good ground reference for logic and sensor work
- keep high current off this board in revision 1

What the board should include:

- XIAO Plus module footprint using the official Seeed module data
- mating geometry for the Round Display based on the standard XIAO pin rows
- 24 V input connector for auxiliary power only, not TEC current path
- 5 V buck stage or a clearly documented 5 V input path from an external buck module; for the current powered prototype, the external TOBSUN EA15-5V module is mandatory
- JST-VH for the 24 V auxiliary input, JST-PH for low-current sensor I/O, and JST-XH for the driver-control link
- one dedicated 3-pin temperature-bus connector for the shared five-probe DS18B20 harness
- separate low-current connectors for humidity and leak sensing
- 1-Wire pull-up and a serviceable harness plan for the five DS18B20 temperature channels
- SN74AHCT125PW driver-interface buffer
- driver control connector
- alarm output
- Tag-Connect TC2030 compatible SWD pads
- optional local user button if not relying entirely on the touch display

What the board should not do in rev 1:

- switch 6 A TEC current directly unless the whole board is redesigned as a real power board
- crowd the XIAO antenna with planes, shields, or metal standoffs

## Round Display pin budget impact

The Round Display consumes almost the full standard XIAO header pin set.

Pins used by the Round Display stack:

- D1: LCD_CS
- D3: LCD_DC
- D4: I2C SDA for touch and RTC
- D5: I2C SCL for touch and RTC
- D7: touch interrupt
- D2: microSD chip select
- D8, D9, D10: SPI for microSD
- D6: screen backlight control on the display board when the KE switch is in the display position
- D0: battery measurement path on the display board when the KE switch is in the display position

Implication:

- standard XIAO nRF52840 is too pin-starved for this project once the Round Display is added
- XIAO nRF52840 Plus is the correct variant because the additional pads can carry the non-HMI system I/O

## Suggested system I/O allocation

This is the schematic-planning map for rev 1.

- Standard XIAO pins reserved for Round Display: D1, D2, D3, D4, D5, D7, D8, D9, D10, and likely D6 and D0 depending the display switch position used
- Plus-only extra pad 1: 1-Wire temperature bus for water, cold-block, hot-side, intake-air, and outlet-air DS18B20 probes
- Plus-only extra pad 2: leak sensor input
- Plus-only extra pad 3: TEC_PWM to driver buffer
- Plus-only extra pad 4: TEC_EN to driver buffer
- Plus-only extra pad 5: TEC_DIR or second PWM line to driver buffer
- Plus-only extra pad 6: buzzer or alarm output
- Plus-only extra pad 7: fan tach input
- Plus-only extra pad 8: fan PWM output or spare digital output
- Plus-only extra pad 9: spare service input, interlock, or future flow switch

Exact mapping of these functions to the official Plus pad names should follow Seeed's official symbol and footprint during actual schematic capture.

Exact mechanical attachment of the hot-side and cold-block DS18B20 sensors should be decided during packaging, not during pin-budget planning.

## Preferred DS18B20 connector and harness layout

Board-side connector strategy:

- use one board-side connector for the shared temperature bus, not five parallel temperature connectors on the PCB
- recommended connector class for the rev-1 temperature bus: keyed 3-pin JST-PH class or equivalent serviceable locking connector
- pin order should be fixed and documented as 3V3, 1WIRE_TEMP, GND

Harness strategy:

- run the five temperature points in powered 3-wire mode, not parasite-power mode
- use one main 24 to 26 AWG three-conductor harness from the controller board to a splice point near the prototype support frame and thermal assembly
- from that splice point, make four short local drops to cold-block, hot-side, intake-air, and outlet-air sensors
- make the water-temperature branch the only longer run and route it with the hose or water line path instead of letting it dangle near the fan wiring
- label each branch clearly as T_WATER, T_COLD, T_HOT, T_AIR_IN, and T_AIR_OUT

Practical routing rules:

- keep the four local air and block sensor branches as short as practical so the 1-Wire bus behaves like one trunk with short stubs rather than a large star
- keep the humidity and leak wiring off the temperature harness entirely
- place the single 1-Wire pull-up on the controller board only; do not duplicate pull-ups in the harness or sensor pigtails
- keep the temperature harness on the sensor edge of the board, away from the TEC driver wiring bundle

## Rev-1 DS18B20 placement and lead targets

Reference routing point:

- place S_TEMP on the inside face of the rear panel, centered in X, below the driver shelf and about 25 to 35 mm above the top of the block
- treat all local branch lengths below as measured from S_TEMP to the active sensing tip, not from J3
- target branch lengths should include one small service loop but should not leave large unused coils near the fan or driver wiring

Temperature harness target lengths:

- H_TEMP trunk from J3 to S_TEMP: 280 mm target
- T_WATER branch: 1200 mm target, then trim only after the full tank and cabinet routing is confirmed
- T_COLD branch: 200 mm target
- T_HOT branch: 180 mm target
- T_AIR_IN branch: 220 mm target
- T_AIR_OUT branch: 100 mm target

Exact rev-1 mounting locations:

- T_WATER: immerse in the display tank at mid-depth, away from the return jet and away from the cold block assembly, with the sensing tip at least 100 mm from the filter return stream and not resting on the glass or substrate
- T_COLD: bond to the display-side outer wall of the cold-block body, centered on the straight-channel region at about mid-length of the block, roughly 8 to 10 mm above the block bottom and safely below the lid-base split plane
- T_HOT: bond to the exposed cooler-base shoulder or first heat-pipe root zone, on the side of the base that remains accessible after the fan is installed, with the sensing tip as close as practical to the copper spreader plane and kept out of the direct fin-pack airflow
- T_AIR_IN: suspend the sensing tip in the intake gap between the display mast side and the cooler fan face, about 12 to 15 mm ahead of the fan intake plane and about 20 to 25 mm off the fan hub center so it sees moving air instead of the dead zone at the hub
- T_AIR_OUT: suspend the sensing tip in the exhaust gap between the cooler rear face and the PSU side, about 3 to 5 mm behind the rear fin face and about 20 to 25 mm off the hub center, without letting the probe touch the PSU panel, rear shelf, or fin edges

Mounting method guidance:

- T_COLD and T_HOT should use a thin bonded attachment method such as thermally conductive epoxy, aluminum tape plus strain relief, or a compact clamped tab that does not add much thermal mass
- T_AIR_IN and T_AIR_OUT should be supported by a light clip, loom tie, or heat-shrink standoff so the sensing tip sits in the airstream and not against metal or ABS
- T_WATER should use its factory waterproof encapsulation directly and should not share a cable sleeve with the TEC power wiring

## Wireless design note

The stainless block, CPU cooler, PSU, and enclosure metal can all hurt BLE performance.

Design implication:

- place the XIAO near a plastic wall or open air edge of the enclosure
- keep the antenna end away from the wet block and away from large ground pours
- if necessary, use a short cable to physically separate the controller board from the thermal assembly

## Preferred bring-up order

1. power the XIAO and sensors from a bench supply or the TOBSUN EA15-5V logic buck only
2. validate Round Display bring-up using the Arduino GFX or Seeed_GFX path
3. validate sensor readings and BLE behavior
4. connect the external TEC driver with no TEC attached
5. verify safe default states and PWM behavior through the level-shift or buffer stage
6. attach the TEC and hot-side cooling
7. enable thermal testing with water loop last
