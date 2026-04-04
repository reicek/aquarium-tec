# Seeed Studio XIAO nRF52840 And nRF52840 Plus Notes

This file summarizes the XIAO nRF52840 family technical details that matter to this project, with emphasis on why the project baseline moved to the Plus variant.

## Why this module family fits the project

The Seeed Studio XIAO nRF52840 family is a good match because it combines:

- very small footprint
- onboard BLE capability
- enough GPIO and serial interfaces for sensors and control
- an SMT-friendly module form factor that can be mounted on a custom carrier PCB

The project baseline is now the XIAO nRF52840 Plus rather than the standard XIAO nRF52840.

## Core technical details

Module:

- standard product: Seeed Studio XIAO nRF52840
- standard Seeed SKU: 102010448
- project baseline product: Seeed Studio XIAO nRF52840 Plus
- project baseline Seeed SKU: 102010672
- dimensions: 21 x 17.8 mm
- form factor: XIAO family castellated / SMT-friendly module

MCU:

- Nordic nRF52840
- ARM Cortex-M4F
- 64 MHz

Memory:

- on-chip: 1 MB flash, 256 KB RAM
- onboard external flash: 2 MB QSPI flash

Wireless:

- Bluetooth Low Energy 5.4
- Bluetooth Mesh support
- NFC support
- onboard antenna

Power and electrical:

- logic level: 3.3 V I/O only
- typical operating rail: 3.3 V
- Type-C / VBUS input: 5 V
- battery input support: 3.7 V nominal Li-ion / LiPo
- onboard charger IC: BQ25101 family behavior referenced by Seeed resources
- selectable charging current: 50 mA or 100 mA
- standby power consumption: about 5 uA class according to Seeed material

Interfaces called out by Seeed for the base XIAO nRF52840:

- 1 x UART
- 1 x I2C
- 1 x SPI
- 1 x NFC
- 1 x SWD
- 11 GPIO with PWM capability
- 6 ADC-capable inputs

Additional Plus-variant notes from Seeed:

- about 9 additional SMD or castellation GPIO beyond the standard XIAO header set
- around 20 PWM-capable GPIO total in the Plus family description
- extra interfaces exposed compared with the base board, including additional serial resources
- same classic 21 x 17.8 mm XIAO footprint, but with expanded backside pad access

Other onboard items:

- reset button
- RGB user LED
- charge/status LED

## Project implications

### Strong positives

1. Wireless telemetry and configuration are available without adding another radio.
2. The module is small enough to place on a compact controller board.
3. The module already exists as an SMT-friendly production part, which is helpful for PCBWay assembly.
4. Seeed provides schematics, KiCad project files, footprints, symbol libraries, dimension drawings, and bottom-pad data.

### Constraints that matter here

1. All user I/O should be treated as 3.3 V only.
2. The onboard antenna needs a real keepout strategy.
3. The board should not be buried next to the stainless block or CPU cooler if BLE range matters.
4. The first rev should use the XIAO as a module on a carrier or interface board, not as a loose dev board on wiring.
5. If the Round Display is used, the standard header pins are heavily consumed, so the Plus-only additional pads become the practical system I/O reserve.

## Suggested PCB design rules around the XIAO

For a custom carrier board to be assembled by PCBWay:

- place the XIAO at a board edge so the antenna end faces outward
- avoid copper pour, ground pour, or tall metal near the antenna end of the module
- avoid standoffs, shields, or the PSU directly beside the antenna
- keep USB access possible, or provide a clear programming strategy through pads or fixture access
- add SWD pads for recovery and low-level debugging
- use Seeed's official footprint and bottom-pad data rather than measuring from product photos
- if using the Plus variant, route the extra backside pads intentionally; they are the reason to use the Plus variant at all

## Round Display compatibility note

The Round Display is a strong HMI option for this project, but it changes the pin budget dramatically.

Important points:

- hardware fit is aligned with the classic XIAO form factor
- on the nRF52840 family, the display path is safer through Arduino GFX or Seeed_GFX than through the TFT-only examples
- using the Plus variant solves the I/O shortage created by the display, but only if the custom PCB actually exposes the extra Plus pads

## Practical notes from Seeed documentation

- Seeed calls out two Arduino board-package options with different tradeoffs
- BLE / low-energy focused work is typically associated with the Seeed nRF52 boards package
- some Seeed package combinations may need `Adafruit_TinyUSB` for reliable Serial behavior
- the module supports Arduino, CircuitPython, and MicroPython

## Project-specific recommendation

Use the XIAO Plus on an interface or interposer PCB that provides:

- regulated power input
- connectorized sensors
- driver interface conditioning
- alarm outputs
- test pads

Prefer this over the standard XIAO nRF52840 when the Round Display is part of the system.

Avoid trying to integrate the full TEC power stage onto the same first-pass XIAO carrier board.

## Useful resources to pull later if needed

Seeed exposes resources for the XIAO family including:

- schematic PDF
- KiCad project files
- XIAO footprints and symbols
- dimension DXF
- bottom-pad positioning data

Those resources should be used when the custom carrier PCB is actually drafted.
