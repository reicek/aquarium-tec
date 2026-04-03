$fn = 96;

part = "preview";
// preview | lid | base | coupon_main | coupon_mid | coupon_small | print_layout | prototype_support | prototype_preview

body_length = 140;
body_width = 92;
body_height = 24;

tec_size = 50;
tec_thickness = 4;
copper_size = 60;
copper_thickness = 5;

cooler_ref_length = 142;
cooler_ref_width = 120;
cooler_ref_height = 157;

lid_thickness = 8;
base_thickness = 16;
roof_thickness = 2;
boolean_overlap = 0.02;

spigot_length = 24;
main_spigot_od = 16.0;
mid_spigot_od = 15.4;
small_spigot_od = 14.8;
spigot_bead_height = 0.8;
spigot_bead_width = 1.2;
bead_offset_from_tip = 16.0;
entry_chamfer = 1.0;

hose_id = 14.5;
bore_radius = hose_id / 2;
spigot_axis_y = body_width / 2;
spigot_axis_z = base_thickness - 1.25;

cavity_length = 112;
cavity_width = 62;
cavity_depth = 6;
transition_length = 28;
channel_run = 56;
channel_count = 6;
fin_width = 2;
side_wall = 0;
channel_width = (cavity_width - ((channel_count - 1) * fin_width) - (2 * side_wall)) / channel_count;

port_bore_x_overlap = 0.25;
lga1700_mount_pitch = 78;
hot_side_mount_clearance_d = 4.3;

support_length = 248;
support_width = 190;
support_beam_height = 8;
support_rail_width = 14;
support_crossmember_width = 14;
support_cradle_overhang = 6;
support_keeper_thickness = 4;
support_keeper_height = 14;
support_display_margin = 42;
support_display_panel_width = 62;
support_display_panel_height = 126;
support_display_panel_thickness = 4;
support_display_window_d = 34;
support_display_window_center_z = 82;
support_display_slot_pitch = 34;
support_display_slot_length = 8;
support_display_slot_width = 3.4;
support_controller_slot_pitch = 24;
support_controller_slot_width = 2.4;
support_psu_size = [215, 115, 30];
support_psu_mount_hole_d = 3.6;
support_psu_mount_pitch_x = 180.8;
support_psu_mount_offset_x = (support_psu_size[0] - support_psu_mount_pitch_x) / 2;
support_psu_mount_offset_z = 26.5;
support_rear_panel_margin_x = 10;
support_rear_panel_thickness = 4;
support_rear_panel_height = 168;
support_rear_gusset_depth = 18;
support_psu_vertical_clear_z = 6;
support_driver_ref_size = [74, 26, 18];
support_driver_shelf_width = 98;
support_driver_shelf_depth = 34;
support_driver_shelf_thickness = 4;
support_driver_clear_above_psu = 6;
support_driver_slot_pitch_x = 56;
support_driver_slot_pitch_y = 16;
support_driver_slot_length = 12;
support_driver_slot_width = 4.5;
support_hose_tab_thickness = 4;
support_hose_tab_width = 10;
support_hose_tab_height = 24;
support_hose_tab_slot_length = 10;
support_hose_tab_slot_width = 4;
support_hose_tab_pair_offset = 17;
support_hose_tab_body_gap = 6;
support_hose_tab_slot_center_z = support_beam_height + 6;

cavity_x0 = (body_length - cavity_length) / 2;
cavity_y0 = (body_width - cavity_width) / 2;
channel_x0 = cavity_x0 + transition_length;
channel_x1 = channel_x0 + channel_run;
cavity_z0 = body_height - roof_thickness - cavity_depth;

landing_size = 64;
landing_margin = (body_length - landing_size) / 2;
landing_y = (body_width - landing_size) / 2;

support_body_x0 = (support_length - body_length) / 2;
support_body_y0 = support_display_margin;
support_rear_span_y0 = support_body_y0 + body_width;
support_psu_vertical_size = [support_psu_size[0], support_psu_size[2], support_psu_size[1]];
support_rear_panel_x0 = support_rear_panel_margin_x;
support_rear_panel_length = support_length - (2 * support_rear_panel_margin_x);
support_rear_panel_y0 = support_width - support_rear_panel_thickness;
support_psu_ref_x0 = (support_length - support_psu_vertical_size[0]) / 2;
support_psu_ref_y0 = support_rear_panel_y0 - support_psu_vertical_size[1];
support_psu_ref_z0 = support_beam_height + support_psu_vertical_clear_z;
support_display_panel_x0 = support_body_x0 + ((body_length - support_display_panel_width) / 2);
support_display_center_x = support_body_x0 + (body_length / 2);
support_driver_shelf_x0 = (support_length - support_driver_shelf_width) / 2;
support_driver_shelf_y0 = support_rear_panel_y0 - support_driver_shelf_depth;
support_driver_shelf_z0 = support_psu_ref_z0 + support_psu_vertical_size[2] + support_driver_clear_above_psu;
support_driver_ref_x0 = (support_length - support_driver_ref_size[0]) / 2;
support_driver_ref_y0 = support_rear_panel_y0 - support_driver_ref_size[1];
support_driver_ref_z0 = support_driver_shelf_z0 + support_driver_shelf_thickness;

o_ring_groove_width = 2.4;
o_ring_groove_depth = 1.5;
o_ring_cl_length = 116;
o_ring_cl_width = 68;

lid_clearance_d = 3.4;
base_pilot_d = 2.5;

coupon_base = [40, 24, 5];
coupon_stub_length = 30;
coupon_spacing = 16;
coupon_spigot_overlap = 0.2;
layout_gap = 16;

screw_xy = [
    [6, 6],
    [70, 6],
    [134, 6],
    [6, 86],
    [70, 86],
    [134, 86]
];

hot_side_mount_xy = [
    [body_length / 2 - (lga1700_mount_pitch / 2), body_width / 2 - (lga1700_mount_pitch / 2)],
    [body_length / 2 + (lga1700_mount_pitch / 2), body_width / 2 - (lga1700_mount_pitch / 2)],
    [body_length / 2 - (lga1700_mount_pitch / 2), body_width / 2 + (lga1700_mount_pitch / 2)],
    [body_length / 2 + (lga1700_mount_pitch / 2), body_width / 2 + (lga1700_mount_pitch / 2)]
];

module body_outer(spigot_od) {
    union() {
        cube([body_length, body_width, body_height]);
        left_spigot_outer(spigot_od);
        right_spigot_outer(spigot_od);
    }
}

module rounded_slot(slot_length, slot_width, slot_height) {
    slot_offset = (slot_length - slot_width) / 2;

    hull() {
        translate([-slot_offset, 0, 0]) cylinder(h = slot_height, d = slot_width);
        translate([slot_offset, 0, 0]) cylinder(h = slot_height, d = slot_width);
    }
}

module left_spigot_outer(spigot_od) {
    radius = spigot_od / 2;

    translate([-spigot_length + entry_chamfer, spigot_axis_y, spigot_axis_z])
        rotate([0, 90, 0]) cylinder(h = spigot_length - entry_chamfer, r = radius);

    translate([-spigot_length, spigot_axis_y, spigot_axis_z])
        rotate([0, 90, 0]) cylinder(h = entry_chamfer, r1 = radius - entry_chamfer, r2 = radius);

    translate([-spigot_length + bead_offset_from_tip, spigot_axis_y, spigot_axis_z])
        rotate([0, 90, 0]) cylinder(h = spigot_bead_width, r = radius + spigot_bead_height);
}

module right_spigot_outer(spigot_od) {
    radius = spigot_od / 2;

    translate([body_length, spigot_axis_y, spigot_axis_z])
        rotate([0, 90, 0]) cylinder(h = spigot_length - entry_chamfer, r = radius);

    translate([body_length + spigot_length - entry_chamfer, spigot_axis_y, spigot_axis_z])
        rotate([0, 90, 0]) cylinder(h = entry_chamfer, r1 = radius, r2 = radius - entry_chamfer);

    translate([body_length + spigot_length - bead_offset_from_tip - spigot_bead_width, spigot_axis_y, spigot_axis_z])
        rotate([0, 90, 0]) cylinder(h = spigot_bead_width, r = radius + spigot_bead_height);
}

module half_mask(z0, z1) {
    translate([-spigot_length - 2, -2, z0])
        cube([body_length + (2 * spigot_length) + 4, body_width + 4, z1 - z0]);
}

module lid_outer(spigot_od) {
    intersection() {
        body_outer(spigot_od);
        half_mask(base_thickness, body_height);
    }
}

module base_outer(spigot_od) {
    intersection() {
        body_outer(spigot_od);
        half_mask(0, base_thickness);
    }
}

module port_bore(x_start, length) {
    translate([x_start, spigot_axis_y, spigot_axis_z])
        rotate([0, 90, 0]) cylinder(h = length, r = bore_radius);
}

module left_port_bore() {
    port_bore(
        -spigot_length - port_bore_x_overlap,
        cavity_x0 + spigot_length + (2 * port_bore_x_overlap)
    );
}

module right_port_bore() {
    port_bore(
        body_length - cavity_x0 - port_bore_x_overlap,
        cavity_x0 + spigot_length + (2 * port_bore_x_overlap)
    );
}

module bore_slice(x_pos) {
    translate([x_pos, spigot_axis_y, spigot_axis_z])
        rotate([0, 90, 0]) cylinder(h = 0.2, r = bore_radius);
}

module plenum_slice(x_pos) {
    translate([x_pos - 0.1, cavity_y0, cavity_z0 - boolean_overlap])
        cube([0.2, cavity_width, cavity_depth + boolean_overlap]);
}

module inlet_diffuser() {
    hull() {
        bore_slice(cavity_x0);
        plenum_slice(channel_x0);
    }
}

module outlet_converger() {
    hull() {
        plenum_slice(channel_x1);
        bore_slice(body_length - cavity_x0);
    }
}

module channel_array() {
    for (index = [0 : channel_count - 1]) {
        translate([
            channel_x0,
            cavity_y0 + side_wall + (index * (channel_width + fin_width)),
            cavity_z0 - boolean_overlap
        ]) cube([channel_run, channel_width, cavity_depth + boolean_overlap]);
    }
}

module lid_screw_holes() {
    for (point = screw_xy) {
        translate([point[0], point[1], base_thickness - 0.1])
            cylinder(h = lid_thickness + 0.2, d = lid_clearance_d);
    }
}

module base_screw_holes() {
    for (point = screw_xy) {
        translate([point[0], point[1], -0.1])
            cylinder(h = base_thickness + 0.2, d = base_pilot_d);
    }
}

module lid_hot_side_mount_holes() {
    for (point = hot_side_mount_xy) {
        translate([point[0], point[1], base_thickness - 0.1])
            cylinder(h = lid_thickness + 0.2, d = hot_side_mount_clearance_d);
    }
}

module base_hot_side_mount_holes() {
    for (point = hot_side_mount_xy) {
        translate([point[0], point[1], -0.1])
            cylinder(h = base_thickness + 0.2, d = hot_side_mount_clearance_d);
    }
}

module o_ring_groove() {
    outer_length = o_ring_cl_length + o_ring_groove_width;
    outer_width = o_ring_cl_width + o_ring_groove_width;
    inner_length = o_ring_cl_length - o_ring_groove_width;
    inner_width = o_ring_cl_width - o_ring_groove_width;

    translate([
        (body_length - outer_length) / 2,
        (body_width - outer_width) / 2,
        base_thickness - o_ring_groove_depth
    ]) difference() {
        cube([outer_length, outer_width, o_ring_groove_depth + 0.05]);

        translate([
            (outer_length - inner_length) / 2,
            (outer_width - inner_width) / 2,
            -0.01
        ]) cube([inner_length, inner_width, o_ring_groove_depth + 0.07]);
    }
}

module lid_part(spigot_od = main_spigot_od) {
    difference() {
        lid_outer(spigot_od);
        lid_screw_holes();
        lid_hot_side_mount_holes();
        left_port_bore();
        right_port_bore();
        inlet_diffuser();
        outlet_converger();
        channel_array();
    }
}

module base_part(spigot_od = main_spigot_od) {
    difference() {
        base_outer(spigot_od);
        base_screw_holes();
        base_hot_side_mount_holes();
        left_port_bore();
        right_port_bore();
        inlet_diffuser();
        outlet_converger();
        o_ring_groove();
    }
}

module tec_reference() {
    color([0.92, 0.72, 0.72, 0.8])
        translate([(body_length - tec_size) / 2, (body_width - tec_size) / 2, body_height + 1])
            cube([tec_size, tec_size, tec_thickness]);
}

module copper_reference() {
    color([0.82, 0.58, 0.32, 0.8])
        translate([(body_length - copper_size) / 2, (body_width - copper_size) / 2, body_height + tec_thickness + 2])
            cube([copper_size, copper_size, copper_thickness]);
}

module cooler_reference() {
    color([0.66, 0.68, 0.72, 0.45])
        translate([
            (body_length - cooler_ref_length) / 2,
            (body_width - cooler_ref_width) / 2,
            body_height + tec_thickness + copper_thickness + 3
        ]) cube([cooler_ref_length, cooler_ref_width, cooler_ref_height]);
}

module landing_outline() {
    color([0.85, 0.25, 0.1, 0.35])
        translate([landing_margin, landing_y, body_height + 0.01])
            cube([landing_size, landing_size, 0.4]);
}

module support_left_rail() {
    translate([
        support_body_x0 - support_cradle_overhang,
        support_body_y0,
        0
    ]) cube([body_length + (2 * support_cradle_overhang), support_rail_width, support_beam_height]);
}

module support_right_rail() {
    translate([
        support_body_x0 - support_cradle_overhang,
        support_body_y0 + body_width - support_rail_width,
        0
    ]) cube([body_length + (2 * support_cradle_overhang), support_rail_width, support_beam_height]);
}

module support_crossmembers() {
    crossmember_x = [
        support_body_x0 - support_cradle_overhang,
        support_body_x0 + (body_length / 2) - (support_crossmember_width / 2),
        support_body_x0 + body_length + support_cradle_overhang - support_crossmember_width
    ];

    for (x_pos = crossmember_x) {
        translate([x_pos, support_body_y0, 0])
            cube([support_crossmember_width, body_width, support_beam_height]);
    }
}

module support_keeper_tabs() {
    tab_x = [
        support_body_x0 + 10,
        support_body_x0 + body_length - 26
    ];
    tab_y = [
        support_body_y0 - support_keeper_thickness,
        support_body_y0 + body_width
    ];

    for (x_pos = tab_x, y_pos = tab_y) {
        translate([x_pos, y_pos, 0])
            cube([16, support_keeper_thickness, support_keeper_height]);
    }
}

module support_display_foot() {
    translate([
        support_display_panel_x0 - 12,
        0,
        0
    ]) cube([support_display_panel_width + 24, support_body_y0, support_beam_height]);
}

module support_display_panel() {
    translate([
        support_display_panel_x0,
        0,
        support_beam_height
    ]) cube([support_display_panel_width, support_display_panel_thickness, support_display_panel_height]);
}

module support_display_gussets() {
    gusset_x = [
        support_display_panel_x0,
        support_display_panel_x0 + support_display_panel_width - 18
    ];

    for (x_pos = gusset_x) {
        hull() {
            translate([x_pos, support_body_y0 - 24, support_beam_height])
                cube([18, 24, 0.1]);
            translate([x_pos, 0, support_beam_height + 40])
                cube([18, support_display_panel_thickness, 0.1]);
        }
    }
}

module support_psu_deck() {
    translate([
        support_body_x0 - support_cradle_overhang,
        support_width - support_rail_width,
        0
    ]) cube([body_length + (2 * support_cradle_overhang), support_rail_width, support_beam_height]);
}

module support_psu_bridges() {
    bridge_x = [
        support_body_x0,
        support_body_x0 + (body_length / 2) - (support_crossmember_width / 2),
        support_body_x0 + body_length - support_crossmember_width
    ];

    for (x_pos = bridge_x) {
        translate([
            x_pos,
            support_rear_span_y0,
            0
        ]) cube([support_crossmember_width, support_width - support_rear_span_y0, support_beam_height]);
    }
}

module support_driver_panel() {
    translate([
        support_rear_panel_x0,
        support_rear_panel_y0,
        support_beam_height
    ]) cube([support_rear_panel_length, support_rear_panel_thickness, support_rear_panel_height]);
}

module support_driver_shelf() {
    translate([
        support_driver_shelf_x0,
        support_driver_shelf_y0,
        support_driver_shelf_z0
    ]) cube([support_driver_shelf_width, support_driver_shelf_depth, support_driver_shelf_thickness]);
}

module support_driver_gussets() {
    gusset_x = [
        support_driver_shelf_x0 + 8,
        support_driver_shelf_x0 + support_driver_shelf_width - 20
    ];

    for (x_pos = gusset_x) {
        hull() {
            translate([
                x_pos,
                support_rear_panel_y0 - support_rear_gusset_depth,
                support_beam_height
            ]) cube([12, support_rear_gusset_depth, 0.1]);
            translate([
                x_pos,
                support_rear_panel_y0,
                support_beam_height + 40
            ]) cube([12, support_rear_panel_thickness, 0.1]);
        }

        hull() {
            translate([
                x_pos,
                support_rear_panel_y0,
                support_driver_shelf_z0 + support_driver_shelf_thickness - 0.1
            ]) cube([12, support_rear_panel_thickness, 0.1]);
            translate([
                x_pos,
                support_driver_shelf_y0 + 4,
                support_driver_shelf_z0
            ]) cube([12, 12, 0.1]);
        }
    }
}

module support_hose_tabs(side = "left") {
    tab_x = side == "left"
        ? support_body_x0 - support_hose_tab_body_gap - support_hose_tab_thickness
        : support_body_x0 + body_length + support_hose_tab_body_gap;
    tab_y = [
        support_body_y0 + (body_width / 2) - support_hose_tab_pair_offset,
        support_body_y0 + (body_width / 2) + support_hose_tab_pair_offset - support_hose_tab_width
    ];

    for (y_pos = tab_y) {
        translate([tab_x, y_pos, 0])
            cube([support_hose_tab_thickness, support_hose_tab_width, support_hose_tab_height]);
    }
}

module support_psu_mount_holes() {
    hole_x = [
        support_psu_ref_x0 + support_psu_mount_offset_x,
        support_psu_ref_x0 + support_psu_vertical_size[0] - support_psu_mount_offset_x
    ];

    for (x_pos = hole_x) {
        translate([
            x_pos,
            support_rear_panel_y0 + support_rear_panel_thickness + 0.1,
            support_psu_ref_z0 + support_psu_mount_offset_z
        ]) rotate([90, 0, 0])
            cylinder(h = support_rear_panel_thickness + 0.2, d = support_psu_mount_hole_d);
    }
}

module support_display_cutouts() {
    for (dx = [-support_display_slot_pitch / 2, support_display_slot_pitch / 2], dz = [-support_display_slot_pitch / 2, support_display_slot_pitch / 2]) {
        translate([
            support_display_center_x + dx,
            support_display_panel_thickness + 0.1,
            support_display_window_center_z + dz
        ]) rotate([90, 0, 0])
            rounded_slot(support_display_slot_length, support_display_slot_width, support_display_panel_thickness + 0.2);
    }

    for (dx = [-support_controller_slot_pitch / 2, support_controller_slot_pitch / 2]) {
        translate([
            support_display_center_x + dx,
            support_display_panel_thickness + 0.1,
            support_beam_height + support_display_panel_height - 14
        ]) rotate([90, 0, 0])
            rounded_slot(6, support_controller_slot_width, support_display_panel_thickness + 0.2);
    }

    translate([
        support_display_center_x,
        support_display_panel_thickness + 0.1,
        support_display_window_center_z
    ]) rotate([90, 0, 0])
        cylinder(h = support_display_panel_thickness + 0.2, d = support_display_window_d);
}

module support_driver_cutouts() {
    for (dx = [-support_driver_slot_pitch_x / 2, support_driver_slot_pitch_x / 2], dy = [-support_driver_slot_pitch_y / 2, support_driver_slot_pitch_y / 2]) {
        translate([
            support_driver_shelf_x0 + (support_driver_shelf_width / 2) + dx,
            support_driver_shelf_y0 + (support_driver_shelf_depth / 2) + dy,
            support_driver_shelf_z0 - 0.1
        ]) rounded_slot(support_driver_slot_length, support_driver_slot_width, support_driver_shelf_thickness + 0.2);
    }
}

module support_hose_tab_slots(side = "left") {
    tab_x = side == "left"
        ? support_body_x0 - support_hose_tab_body_gap - support_hose_tab_thickness
        : support_body_x0 + body_length + support_hose_tab_body_gap;
    slot_x = tab_x + support_hose_tab_thickness + 0.1;
    slot_y = [
        support_body_y0 + (body_width / 2) - support_hose_tab_pair_offset + (support_hose_tab_width / 2),
        support_body_y0 + (body_width / 2) + support_hose_tab_pair_offset - (support_hose_tab_width / 2)
    ];

    for (y_pos = slot_y) {
        translate([
            slot_x,
            y_pos,
            support_hose_tab_slot_center_z
        ]) rotate([0, 90, 0])
            rounded_slot(support_hose_tab_slot_length, support_hose_tab_slot_width, support_hose_tab_thickness + 0.2);
    }
}

module prototype_support_part() {
    difference() {
        union() {
            support_left_rail();
            support_right_rail();
            support_crossmembers();
            support_keeper_tabs();
            support_display_foot();
            support_display_panel();
            support_display_gussets();
            support_psu_deck();
            support_psu_bridges();
            support_driver_panel();
            support_driver_shelf();
            support_driver_gussets();
            support_hose_tabs("left");
            support_hose_tabs("right");
        }

        support_psu_mount_holes();
        support_display_cutouts();
        support_driver_cutouts();
        support_hose_tab_slots("left");
        support_hose_tab_slots("right");
    }
}

module psu_reference() {
    color([0.68, 0.72, 0.72, 0.45])
        translate([
            support_psu_ref_x0,
            support_psu_ref_y0,
            support_psu_ref_z0
        ]) cube(support_psu_vertical_size);
}

module driver_reference() {
    color([0.28, 0.56, 0.32, 0.45])
        translate([
            support_driver_ref_x0,
            support_driver_ref_y0,
            support_driver_ref_z0
        ]) cube(support_driver_ref_size);
}

module display_reference() {
    color([0.16, 0.16, 0.16, 0.75])
        translate([
            support_display_center_x - 21.5,
            support_display_panel_thickness + 0.6,
            support_display_window_center_z - 21.5
        ]) cube([43, 2.2, 43]);
}

module xiao_reference() {
    color([0.14, 0.46, 0.26, 0.8])
        translate([
            support_display_center_x - 10.5,
            support_display_panel_thickness + 0.6,
            support_beam_height + support_display_panel_height - 24
        ]) cube([21, 2.2, 17.8]);
}

module coupon(spigot_od, label_text = "") {
    difference() {
        union() {
            cube(coupon_base);

            translate([coupon_base[0], coupon_base[1] / 2, coupon_base[2] + (spigot_od / 2) - coupon_spigot_overlap])
                rotate([0, 90, 0]) cylinder(h = coupon_stub_length - entry_chamfer, r = spigot_od / 2);

            translate([coupon_base[0] + coupon_stub_length - entry_chamfer, coupon_base[1] / 2, coupon_base[2] + (spigot_od / 2) - coupon_spigot_overlap])
                rotate([0, 90, 0]) cylinder(h = entry_chamfer, r1 = spigot_od / 2, r2 = (spigot_od / 2) - entry_chamfer);

            translate([
                coupon_base[0] + coupon_stub_length - bead_offset_from_tip - spigot_bead_width,
                coupon_base[1] / 2,
                coupon_base[2] + (spigot_od / 2) - coupon_spigot_overlap
            ]) rotate([0, 90, 0]) cylinder(h = spigot_bead_width, r = (spigot_od / 2) + spigot_bead_height);
        }

        if (label_text != "") {
            translate([coupon_base[0] / 2, coupon_base[1] / 2, coupon_base[2] - 0.8])
                linear_extrude(height = 1.2)
                    text(label_text, size = 6, halign = "center", valign = "center", font = "Liberation Sans:style=Bold");
        }
    }
}

module coupon_layout() {
    translate([0, 0, 0]) coupon(main_spigot_od, "16.0");
    translate([coupon_base[0] + coupon_stub_length + coupon_spacing, 0, 0]) coupon(mid_spigot_od, "15.4");
    translate([2 * (coupon_base[0] + coupon_stub_length + coupon_spacing), 0, 0]) coupon(small_spigot_od, "14.8");
}

module print_layout() {
    color([0.90, 0.90, 0.90]) base_part();

    color([0.75, 0.80, 0.92])
        translate([0, body_width + layout_gap, -base_thickness])
            lid_part();

    color([0.92, 0.92, 0.92])
        translate([body_length + spigot_length + 40, 0, 0])
            coupon_layout();
}

module preview() {
    color([0.90, 0.90, 0.90, 1.0]) base_part();
    color([0.76, 0.82, 0.94, 0.8]) lid_part();
    landing_outline();
    tec_reference();
    copper_reference();

    translate([body_length + spigot_length + 40, 0, 0])
        color([0.94, 0.94, 0.94]) coupon_layout();
}

module prototype_preview() {
    color([0.90, 0.91, 0.92, 1.0]) prototype_support_part();

    translate([support_body_x0, support_body_y0, support_beam_height]) {
        color([0.90, 0.90, 0.90, 1.0]) base_part();
        color([0.76, 0.82, 0.94, 0.8]) lid_part();
        landing_outline();
        tec_reference();
        copper_reference();
        cooler_reference();
    }

    display_reference();
    xiao_reference();
    psu_reference();
    driver_reference();
}

if (part == "preview") {
    preview();
} else if (part == "lid") {
    lid_part();
} else if (part == "base") {
    base_part();
} else if (part == "coupon_main") {
    coupon(main_spigot_od, "16.0");
} else if (part == "coupon_mid") {
    coupon(mid_spigot_od, "15.4");
} else if (part == "coupon_small") {
    coupon(small_spigot_od, "14.8");
} else if (part == "print_layout") {
    print_layout();
} else if (part == "prototype_support") {
    prototype_support_part();
} else if (part == "prototype_preview") {
    prototype_preview();
} else {
    preview();
}