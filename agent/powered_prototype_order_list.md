# Powered Prototype Order List

This file freezes the current buy list for the first powered prototype.

Current exact powered-prototype electrical baseline:

- external IBT-2 Double BTS7960 43 A H-bridge module
- external TOBSUN EA15-5V 24 V to 5 V 3 A 15 W buck mounted below the BTS7960 on the lower support-spine landing
- Thermalright Assassin X 120 Refined SE heatsink with the stock fan set aside and replaced by a Noctua NF-F12 industrialPPC-24V-2000 IP67 PWM fan so the prototype only needs 24 V and 5 V rails

Current layout and wiring assumptions:

- use the main 16.0 mm hose-plug option on both ports for the current dry prototype component sheet and wiring documentation
- leak sensor is included in the current dry-build prototype, not left as an optional add-on
- harness colors and target cut lengths are defined in `agent/powered_prototype_wiring_diagram.md`, and the powered-prototype 2D reference sheets are `powered_prototype_component_layout.svg` and `powered_prototype_electrical_block.svg`

## Order now: fabricated items

| Item                    |   Qty | Exact model or identifier                                                                   | Notes                                                                                                                    |
| ----------------------- | ----: | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| PLA prototype print set | 1 set | `prototype_lid_base_bundle.stl`, `prototype_hose_bundle.stl`, `prototype_support_frame.stl` | Order the full fit set together so the block, hose-plug options, and powered support geometry are validated in one round |
| Copper spreader         |     1 | Custom C110 copper plate, 60 x 60 x 5 mm                                                    | Flat machined plate between TEC and cooler                                                                               |

## Order now: exact bought parts

| Item                             |    Qty | Exact model or identifier                                           | Notes                                                                                                                                                       |
| -------------------------------- | -----: | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| TEC module                       |      1 | TEC126306 / TEC1-26306, 50 x 50 mm, 24 V, 6 A nominal               | Locked thermal baseline                                                                                                                                     |
| Hot-side heatsink                |      1 | Thermalright Assassin X 120 Refined SE                              | Use the heatsink and Intel mounting hardware; do not use the bundled 12 V fan in the current exact build                                                    |
| Hot-side fan                     |      1 | Noctua NF-F12 industrialPPC-24V-2000 IP67 PWM                       | Replaces the stock cooler fan and deletes the need for a 24 V to 12 V rail                                                                                  |
| Thermal paste                    |      1 | Noctua NT-H2, 10 g                                                  | Enough for TEC, spreader, and cooler interfaces plus rework                                                                                                 |
| Main PSU                         |      1 | Mean Well LRS-350-24                                                | Locked project PSU                                                                                                                                          |
| TEC driver                       |      1 | IBT-2 Double BTS7960 43 A H-bridge module, 50 x 50 mm board class   | Matches the current support-driver reference envelope                                                                                                       |
| Logic buck module                |      1 | TOBSUN EA15-5V, 24 V to 5 V, 3 A, 15 W DC-DC converter              | Mandatory 24 V to 5 V logic supply for the powered prototype; current support layout assumes this larger enclosed module on the lower support-spine landing |
| Main controller                  |      1 | Seeed Studio XIAO nRF52840 Plus, SKU 102010672                      | Locked controller baseline                                                                                                                                  |
| Local HMI                        |      1 | Seeed Studio Round Display for XIAO, SKU 104030087                  | Locked local HMI baseline                                                                                                                                   |
| Water temperature probe          |      1 | Adafruit Waterproof DS18B20, PID 381                                | Skip this purchase only if the stock probe already on hand is kept                                                                                          |
| Cold-block temperature sensor    |      1 | Analog Devices DS18B20+                                             | Use TO-92 package on a short custom lead for bonded cold-side sensing                                                                                       |
| Hot-side temperature sensor      |      1 | Analog Devices DS18B20+                                             | Use TO-92 package on a short custom lead near the cooler base or heat-pipe root                                                                             |
| Intake-air temperature sensor    |      1 | Analog Devices DS18B20+                                             | Use TO-92 package on a light lead support upstream of the fan                                                                                               |
| Outlet-air temperature sensor    |      1 | Analog Devices DS18B20+                                             | Use TO-92 package on a light lead support in the exhaust gap                                                                                                |
| Humidity sensor                  |      1 | Adafruit SHT31-D Temperature and Humidity Sensor Breakout, PID 2857 | Current exact condensation-monitor choice                                                                                                                   |
| Leak sensor                      |      1 | DFRobot Gravity Water Sensor, SEN0205                               | Included exact prototype leak sensor; wire it as the current thresholded leak-input path in the dry-build harness                                           |
| Local alarm                      |      1 | Mallory Sonalert PS-580Q                                            | 5 V buzzer for local failsafe indication                                                                                                                    |
| Driver interface buffer          |      1 | Texas Instruments SN74AHCT125PW                                     | Treat as standard with the generic BTS7960 module                                                                                                           |
| TEC branch fuse                  |      1 | Bussmann ATM-10                                                     | Place near the PSU branch point                                                                                                                             |
| Logic branch fuse                |      1 | Bussmann ATM-2                                                      | Protect the Pololu buck and logic branch                                                                                                                    |
| TEC wiring                       |  1 lot | BNTECHGO 16 AWG silicone wire, red and black                        | Keep TEC and driver runs short                                                                                                                              |
| General logic wiring             |  1 lot | Alpha Wire 3050, 24 AWG stranded hookup wire                        | Logic, alarm, and low-current control runs                                                                                                                  |
| Temperature harness wire         |  1 lot | Belden 9533, 24 AWG 3-conductor                                     | Shared 1-Wire trunk plus serviceable probe branches                                                                                                         |
| J1 connector set                 |  1 set | JST B2P-VH(LF)(SN), VHR-2N, SVH-21T-P1.1                            | 24 V auxiliary input connector family                                                                                                                       |
| J3 and J5 connector sets         | 2 sets | JST B3B-PH-K-S(LF)(SN), PHR-3, SPH-002T-P0.5S                       | Shared temperature bus and leak-sensor connector family                                                                                                     |
| J4 connector set                 |  1 set | JST B4B-PH-K-S(LF)(SN), PHR-4, SPH-002T-P0.5S                       | Humidity or auxiliary I2C connector family                                                                                                                  |
| J2 connector set                 |  1 set | JST B5B-XH-A(LF)(SN), XHP-5, SXH-001T-P0.6                          | External TEC-driver control connector family                                                                                                                |
| SWD cable                        |      1 | Tag-Connect TC2030-IDC-NL                                           | Current exact debug-programming cable choice                                                                                                                |
| Insulation foam                  |  1 lot | Armacell AP ArmaFlex self-adhesive sheet, 6 mm                      | Default block and first-tube insulation thickness                                                                                                           |
| Small cable ties                 | 1 pack | HellermannTyton T18R                                                | Use for the lower buck mount and harness dressing                                                                                                           |
| Sensor bond adhesive             |      1 | MG Chemicals 8329TCM-6ML                                            | For hot-side and cold-block sensor attachment                                                                                                               |
| Sensor restraint tape            | 1 roll | 3M 1181 copper foil tape, 1/4 in width                              | Supplemental probe restraint and strain relief                                                                                                              |
| Block screws                     |      6 | M3 x 30 mm A2-70 stainless socket-head cap screws                   | Current exact prototype through-bolt choice                                                                                                                 |
| Block nuts                       |      6 | M3 A2 nylon-insert locknuts                                         | Use with the through-bolts                                                                                                                                  |
| Block washers                    |     12 | M3 stainless flat washers                                           | One washer under each head and nut                                                                                                                          |
| Compression sleeves / hard stops |      6 | 316 stainless spacer, 3.2 mm ID x 4.0 mm OD x 24 mm long            | Buy off the shelf if available or cut from spacer stock                                                                                                     |

## Order after one measurement or hardware check

| Item            |      Qty | Trigger                                           | Exact family or identifier                           | Notes                                                                                               |
| --------------- | -------: | ------------------------------------------------- | ---------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| Tubing clamps   |   4 to 6 | After real hose and plug fit are checked          | Oetiker 167-series 304 stainless stepless ear clamps | Freeze the exact clamp size only after the chosen hose-plug OD is validated on the real Fluval hose |
| Final seal cord | 1 length | After groove measurement on the released wet part | EPDM 70 A, 2.0 mm round cord                         | Cut length should come from the released groove, not the nominal SCAD perimeter                     |

## Do not order yet

| Item                                                 | Reason                                                                       |
| ---------------------------------------------------- | ---------------------------------------------------------------------------- |
| Final 316L lid, CNC POM base, and CNC POM hose plugs | Wait until hose-plug fit and Gate 1 geometry validation are complete         |
| Custom controller interface board                    | Not yet captured as a finished schematic, PCB layout, and PCBA package       |
| Final gasket or joined seal quantity                 | Freeze after the hybrid wet-part geometry and groove dimensions are released |
