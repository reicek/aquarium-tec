# Decision Log

This file records the major design choices, what was considered, and why each choice landed where it did.

## Cooling approach

### Rejected: cooling the bottom of the Fluval 107 canister

Reason:

- the canister body is plastic, which becomes the dominant thermal bottleneck
- even with a spreader plate and insulation, the expected improvement below room temperature is modest
- thermal contact to the canister body is harder to control than a direct water-side exchanger

### Rejected: gel pack or reusable cold pad between TEC and canister

Reason:

- gel behaves like a poor thermal conductor in steady state
- it adds thermal resistance instead of spreading heat effectively
- it sacrifices the TEC temperature differential to the interface layer

### Selected: custom inline cold block in the hose path

Reason:

- removes the plastic wall bottleneck
- allows direct control of the hydraulic geometry
- allows matching the Fluval hose size much better than most off-the-shelf chillers
- easier to insulate properly

## Channel path geometry

### Rejected: serpentine or S-path core

Reason:

- too much pressure drop for a canister-filter loop that already has an inline CO2 diffuser
- larger risk of trapped air
- worse for debris tolerance even if the current water is clean
- non-uniform temperature across the TEC footprint

### Selected: straight parallel channels with plenums

Reason:

- lowest pressure drop for a given heat transfer area
- better thermal uniformity across the TEC footprint
- simpler machining
- lower clogging risk

## Channel count

### Considered: 7 channels

This was the earlier balanced concept. It already had enough open area relative to the hose but was not the lowest-head-loss option.

### Considered: 9 channels

Reason for rejection:

- smaller hydraulic diameter
- more machining complexity in stainless
- more pressure drop with marginal thermal benefit in this use case

### Selected: 6 channels

Reason:

- better hydraulic margin
- still plenty of water-side surface area
- channel set open area remains safely above hose area
- better fit for the stated priority: do not increase backpressure in the Fluval plus CO2 diffuser loop

## Internal bore strategy

### Early issue found

One earlier concept kept the channel pack open enough but used a 13.5 mm port bore. That would have created the real restriction.

### Selected correction

- keep the minimum internal bore at 14.5 mm or larger end-to-end
- use smooth round-to-plenum transitions
- avoid threaded fittings in the flow path for the first version

## Hose-plug strategy

### Selected for prototype

- separate replaceable hose plugs, one per port
- no threads required
- user plans to clamp the hose externally

Reason:

- lets the PLA prototype validate the same swappable hose-plug architecture planned for the final hybrid build
- avoids extra fittings in the flow path
- keeps hose OD changes isolated to the plug parts

### Hose-plug fit approach

The final OD is not yet frozen. The current strategy is:

- full block best guess: 16.0 mm OD
- option 1: 15.4 mm OD hose plug
- option 2: 14.8 mm OD hose plug

Reason:

- resolve hose grip in one prototype round using the real plug geometry
- do not lock the final hose-plug OD before physical hose-plug testing

### Selected for final wet revision

- separate replaceable hose plugs, one per port
- trapped anti-rotation plug interface between lid and base
- lid stays 316L stainless steel
- base and hose plugs move to CNC POM

Reason:

- keep metal only where the TEC landing and channel pack need it
- reduce final wet-part cost versus a full 316L block
- make hose-plug replacement or OD changes possible without remachining the lid

## Materials

### Rejected: aluminum in the wet path

Reason:

- poor choice for long-term aquarium water contact
- avoid corrosion and contamination risk

### Selected: 316L lid plus CNC POM base and hose plugs as default final wet architecture

Reason:

- lid keeps the TEC landing and channel pack in metal
- POM is a realistic CNC aquarium-contact plastic for the base and replaceable hose plugs
- easier cost target than a full 316L block

### Rejected for final wet release: coated 3D-printed plastic wet parts

Reason:

- coating integrity becomes the water barrier instead of the substrate
- seal grooves, bores, and clamp-load regions are poor places to depend on hand-applied coatings

## Manufacturing path

### Selected phase order

1. PLA prototype for fit and space validation
2. hybrid CNC lid, base, and hose-plug set after fit is confirmed
3. controller carrier PCB and wiring harness refinement

Reason:

- fastest way to de-risk geometry before paying for wet-metal machining

## Hot-side cooling

### Accepted: 230 W class CPU air cooler

Reason:

- adequate for the expected hot-side load in this prototype
- commonly available and easy to mount

### Important added decision

Use a copper spreader between TEC and CPU cooler.

Reason:

- many CPU cooler bases do not comfortably cover a full 50 x 50 mm TEC
- the copper plate reduces local thermal crowding and mechanical stress concentration

## Electronics architecture

### Selected controller

- Seeed Studio XIAO nRF52840 Plus

Reason:

- wireless capability
- enough interfaces for sensors and control
- small module form factor suitable for carrier-board assembly
- keeps the classic XIAO size while adding 9 additional SMD GPIO

### Selected local HMI

- Seeed Studio Round Display for XIAO

Reason:

- gives a compact touch screen and operator interface without designing a custom display PCB
- includes useful extras such as RTC and microSD
- matches the XIAO ecosystem already chosen for the controller

### Consequence of the HMI choice

The Round Display consumes most of the standard XIAO pins:

- D1, D3, D4, D5, D7 for display and touch control
- D2, D8, D9, D10 for the microSD path
- D0 and D6 may also be tied to battery readout and backlight depending on the board switch position

Therefore:

- standard XIAO nRF52840 is no longer an attractive baseline for this project
- XIAO nRF52840 Plus is the cleaner fit because the additional pads can carry the non-HMI system I/O
- the first custom board should be an interface or interposer board that can actually break out those additional pads

### Selected control-board philosophy

- first PCB revision should be a logic, sensor, and HMI interface board, not the full 24 V 6 A power stage

Reason:

- separates low-risk control PCB work from higher-risk power electronics
- makes PCBWay assembly easier
- allows reuse of a known external TEC driver during the first system bring-up
- makes it possible to use XIAO Plus additional pads while still mating to the Round Display

### Prototype driver status

- the approved first powered-prototype driver is the external Double BTS7960 43A H-bridge module
- a better-qualified driver still remains the later upgrade path if reliability becomes more important than cost

Reason:

- user-approved exact low-cost module for prototype bring-up is now known
- quality variation in clone modules is a known concern
- if reliability becomes more important than cost, a better-qualified driver should replace it

## Temperature sensing architecture

### Selected: DS18B20 for all rev-1 temperature channels

- aquarium water
- cold block
- hot side
- intake air / ambient reference
- outlet air

Reason:

- the user already has enough DS18B20 sensors on hand
- one shared 1-Wire bus keeps the Round Display pin budget manageable on the XIAO Plus
- it simplifies the carrier-board schematic, connector strategy, and firmware compared with mixing analog NTC and digital temperature paths
- it keeps the first controller PCB focused on logic and sensing, not extra analog conditioning circuits

Consequence:

- the Plus-only temperature input remains a single shared 1-Wire bus
- temperature-sensor electrical type is no longer an open item for rev 1
- the remaining open detail is mechanical attachment method for the hot-side and cold-block probes, not sensor family selection

### Selected: one board-side temperature-bus connector with an off-board five-drop harness

- one keyed 3-pin board connector for 3V3, 1WIRE_TEMP, and GND
- one powered 3-wire harness leaving the controller board
- one off-board splice point near the support frame or thermal assembly
- four short local drops for cold-block, hot-side, intake-air, and outlet-air probes
- one longer branch for the water probe

Reason:

- avoids wasting board area on five parallel temperature connectors
- keeps the PCB-side 1-Wire topology cleaner than a five-way star directly on the board
- improves serviceability because the whole temperature harness can be unplugged as one assembly
- fits the moderate-density, serviceable rev-1 carrier-board philosophy better than a connector-heavy board edge

## Performance expectation

### Updated expectation after switching to inline block

- custom inline block: about 3 to 5 C below room temperature is the working realistic goal
- optimistic: 5 to 6 C below room temperature with good insulation and favorable room heat load

This is considered a prototype performance estimate, not a locked guarantee.

## Controller family alternatives considered

### Considered: XIAO ESP32S3 or XIAO ESP32S3 Plus

Reason it remains an alternate rather than the current default:

- stronger display and LVGL path
- more processing margin for richer UI
- but changes the controller family, power profile, and software baseline more than necessary

Current stance:

- if the project later prioritizes a richer UI above all else, ESP32S3 Plus is the best alternate
- for now, nRF52840 Plus is the least disruptive and most coherent evolution of the original controller choice