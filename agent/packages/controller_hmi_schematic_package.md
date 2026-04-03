# Controller And HMI Schematic Package

This file is the schematic-ready package for the first controller revision after adding the Round Display and switching to the XIAO nRF52840 Plus baseline.

## Design intent

Build a controller subsystem that:

- uses the Seeed Studio XIAO nRF52840 Plus as the wireless controller
- uses the Seeed Studio Round Display for XIAO as the local screen and touch HMI
- preserves the standard Round Display pin mapping
- uses the Plus-only additional pads for non-HMI system I/O
- keeps the 24 V / 6 A TEC power stage off-board in rev 1

## Recommended board name

TEC-HMI-CTRL-REV1

## Architecture summary

Preferred block structure:

- J1: 24 V auxiliary input from main PSU branch
- U1: 24 V to 5 V buck or 5 V regulator module, 1 A class
- U2: Seeed Studio XIAO nRF52840 Plus
- U3: Seeed Studio Round Display for XIAO mating interface
- U4: 3.3 V to 5 V compatible driver buffer if needed for TEC driver inputs
- J2: external TEC driver control connector
- J3: shared DS18B20 temperature-harness trunk connector
- J4: auxiliary I2C or humidity sensor connector if not placed on board
- J5: leak sensor connector
- J6: fan tach and PWM connector if needed
- J7: buzzer or alarm connector
- TP1..n: SWD and debug test pads

## Board philosophy

- 4-layer FR-4
- 1.6 mm
- ENIG
- moderate logic density, no aggressive miniaturization
- prioritize antenna clearance, connector clarity, and serviceability

## Power rails

Primary rails:

- +24VAUX: low-current branch derived from the main 24 V PSU
- +5V_HMI: feeds XIAO VBUS path and the Round Display subsystem
- +3V3_LOGIC: derived from XIAO or a local regulated rail for sensors and pull-ups
- GND_LOGIC: common logic ground tied to driver and PSU ground at the board entry strategy

Recommended power assumptions:

- target at least 500 mA on the 5 V logic/HMI rail
- 1 A 5 V capacity is preferred margin

## Functional blocks

### U1: Main controller

- Part: Seeed Studio XIAO nRF52840 Plus
- Function: BLE, application logic, HMI logic, sensor acquisition, alarms, TEC driver command generation

### U2: HMI display

- Part: Seeed Studio Round Display for XIAO
- Function: local screen, touch input, RTC, optional microSD

### U3: Driver interface buffer

- Part class: AHCT-family or equivalent 3.3 V input, 5 V output-capable buffer
- Reason: protect against unknown logic thresholds on generic TEC driver modules
- Suggested signals through buffer:
  - TEC_PWM
  - TEC_EN
  - TEC_DIR

### U4: 24 V to 5 V logic power stage

- Use a conservative, easy-to-source module or well-supported buck design
- Rev 1 goal is reliability, not minimum BOM cost

## Standard XIAO pins reserved for the Round Display

Treat these as consumed by the Round Display stack:

- D1: LCD_CS
- D3: LCD_DC
- D4: SDA for touch and RTC, shared I2C bus
- D5: SCL for touch and RTC, shared I2C bus
- D7: touch interrupt
- D2: microSD CS
- D8: SPI SCK
- D9: SPI MISO
- D10: SPI MOSI
- D6: screen backlight control when the display switch is in the display function position
- D0: display battery measurement path when the display switch is in the display function position

## Plus-only additional pad allocation

Use the additional XIAO Plus pads for the non-HMI system I/O.

Planning allocation:

- XP1: 1-Wire temp bus for all DS18B20 probes
- XP2: leak sensor digital input
- XP3: TEC_PWM output
- XP4: TEC_EN output
- XP5: TEC_DIR output or second PWM output
- XP6: buzzer or alarm output
- XP7: fan tach input
- XP8: fan PWM output or spare digital output
- XP9: spare input for flow switch, door switch, or service mode

Note:

- exact pad names should be pulled from the official Seeed XIAO Plus symbol and footprint during actual schematic capture
- this package intentionally freezes the function map, not the exact symbol pin numbers

## Shared buses

### I2C bus

Shared on D4 and D5:

- Round Display RTC
- Round Display touch controller
- optional SHT31 humidity sensor

Design notes:

- check total pull-up strength
- avoid duplicate strong pull-ups if the display board already provides them

### 1-Wire bus

Shared on XP1:

- aquarium water DS18B20
- hot-side DS18B20
- cold-block DS18B20
- intake-air DS18B20
- outlet-air DS18B20

Design notes:

- one pull-up resistor only
- keep cable length reasonable
- use connector and cable conventions that make sensor replacement easy
- size the harness and labeling scheme for five probes from the start

## Connectors

### J1: 24 V auxiliary input

- type: locking pluggable terminal or JST-VH class depending enclosure style
- pins: +24VAUX, GND

### J2: External TEC driver control

- pins:
  - 5V_REF or optional pull-up rail if needed
  - GND
  - TEC_PWM_BUF
  - TEC_EN_BUF
  - TEC_DIR_BUF

### J3: 1-Wire temperature bus

- type: keyed 3-pin JST-PH class or equivalent serviceable low-current connector
- pins: 3V3, 1WIRE_TEMP, GND
- use powered 3-wire DS18B20 mode only; do not use parasite-power mode

### J4: Aux I2C or humidity sensor

- pins: 3V3, SDA, SCL, GND

### J5: Leak sensor

- pins: 3V3 or pull-up source, LEAK_IN, GND

### J6: Fan monitor and control

- pins: 12V_FAN or external fan rail, GND, FAN_PWM, FAN_TACH

### J7: Alarm output

- pins: ALARM_OUT, GND

## Preferred temperature harness layout

Use one off-board harness for all five DS18B20 probes.

Board side:

- J3 is the only board-side connector for the 1-Wire temperature bus
- place J3 on the sensor edge of the board, not near the TEC driver connector
- keep the 4.7 kohm class 1-Wire pull-up on the board near the XIAO-side net source

Harness topology:

- H_TEMP: one 24 to 26 AWG three-conductor trunk from J3 to a splice point near the support frame and thermal assembly
- S_TEMP: one off-board splice node or compact harness junction, not five parallel PCB connectors
- branch T_WATER: longer branch routed with the water line or hose path
- branch T_COLD: short branch to the cold-block DS18B20
- branch T_HOT: short branch to the hot-side DS18B20 near the cooler base or heat-pipe root
- branch T_AIR_IN: short branch to the intake-air DS18B20 upstream of the fan
- branch T_AIR_OUT: short branch to the outlet-air DS18B20 in the exhaust stream

Harness rules:

- keep the four local thermal and airflow branches as short as practical so the bus acts like one trunk with short stubs
- keep humidity and leak sensors on their own connectors, not spliced into H_TEMP
- mark each branch with permanent heat-shrink or printed labels matching the firmware names
- keep the temperature harness separate from TEC current wiring and fan power where practical
- if a waterproof off-the-shelf DS18B20 probe includes a long factory cable, treat that as the branch lead and avoid adding another inline extension unless necessary

Target branch lengths from S_TEMP:

- H_TEMP trunk from J3 to S_TEMP: 280 mm target
- T_WATER: 1200 mm target
- T_COLD: 200 mm target
- T_HOT: 180 mm target
- T_AIR_IN: 220 mm target
- T_AIR_OUT: 100 mm target

Target mounting positions:

- S_TEMP: rear panel inside face, centered laterally, below the driver shelf and above the top-of-block envelope
- T_COLD: display-side outer wall of the cold block, centered on the straight-channel region and below the split plane
- T_HOT: exposed cooler-base shoulder or first accessible heat-pipe root near the spreader plane
- T_AIR_IN: 12 to 15 mm ahead of the fan intake face and 20 to 25 mm off the fan hub center
- T_AIR_OUT: 3 to 5 mm behind the rear fin face in the exhaust gap and 20 to 25 mm off the fan hub center
- T_WATER: mid-depth in the aquarium, away from the return jet and away from the glass-contact boundary layer

## Safety defaults

- TEC driver control lines must default to OFF at reset and during boot
- add pull-down or pull-up resistors as needed so the driver cannot self-enable at startup
- if the buffer is unpowered, its outputs must not unintentionally enable the driver

## PCB placement guidance

- place the XIAO antenna end at a board edge with minimal nearby copper
- keep the XIAO away from large metal when installed
- keep the Round Display mating geometry mechanically rigid and clearly keyed
- keep sensor connectors on one edge and the driver connector on a different edge to reduce wiring confusion
- keep SWD and USB access practical

## Firmware implications

- prefer Arduino GFX or Seeed_GFX for the Round Display on nRF52840 family
- do not plan around the TFT-only example path as the primary HMI software baseline
- use one shared 1-Wire bus for all temperature probes
- treat RTC as useful but optional if BLE time sync is adequate later

## Open items before schematic capture is fully frozen

1. exact XIAO Plus additional pad names from official Seeed symbol and footprint
2. exact driver module selected for prototype, which determines whether the level-shift buffer is mandatory
3. exact fan voltage and whether J6 needs a 12 V rail on the board or only a signal connector
4. whether the Round Display is assembled by PCBWay or installed by the user after board delivery