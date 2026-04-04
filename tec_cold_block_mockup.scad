$fn = 96;

part = "preview";
// preview | lid | base | plug_main | plug_mid | plug_small | coupon_main | coupon_mid | coupon_small | print_layout | prototype_lid_base_bundle | prototype_hose_bundle | prototype_hose_lid_base_bundle | prototype_support | prototype_support_assembly | prototype_preview

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

plug_root_flange_od = 22.0;
plug_root_flange_thickness = 2.0;
plug_neck_od = 16.8;
plug_neck_length = 4.0;
plug_capture_head_y = 22.0;
plug_capture_head_z = 15.0;
plug_capture_head_length = 6.0;
plug_capture_head_radius = 2.5;
plug_socket_clearance = 0.15;
plug_throat_d = 17.0;
plug_gasket_id = 17.2;
plug_gasket_od = 21.4;
plug_gasket_recess_depth = 0.85;
plug_socket_end = plug_neck_length + plug_capture_head_length;
plug_layout_pitch = 58;

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
support_display_board_size = 43;
support_display_window_d = 34;
support_display_window_center_z = 82;
support_display_slot_pitch = 34;
support_display_slot_length = 8;
support_display_slot_width = 3.4;
support_controller_slot_pitch = 24;
support_controller_slot_width = 2.4;
support_display_relief_width = support_display_board_size;
support_display_relief_height = support_display_board_size;
support_display_relief_center_z = support_display_window_center_z - support_display_board_size;
support_psu_size = [215, 115, 30];
support_psu_mount_hole_d = 3.6;
support_psu_mount_pitch_x = 150;
support_psu_mount_offset_x = (support_psu_size[0] - support_psu_mount_pitch_x) / 2;
support_psu_mount_offset_z = 26.5;
support_rear_panel_margin_x = 10;
support_rear_panel_thickness = 4;
support_rear_panel_height = 168;
support_rear_gusset_depth = 18;
support_psu_vertical_clear_z = 6;
support_driver_total_depth = 43;
support_driver_outboard_depth = 24;
support_driver_inboard_depth = support_driver_total_depth - support_driver_outboard_depth;
support_driver_ref_size = [49.657, support_driver_total_depth, 49.403];
support_driver_shelf_width = support_driver_ref_size[0];
support_driver_shelf_depth = 10;
support_driver_shelf_thickness = 4;
support_driver_clear_above_psu = 6;
support_driver_cutout_margin = 4.5;
support_driver_cable_notch_width = 24;
support_driver_cable_notch_height = 12;
support_hose_tab_thickness = 4;
support_hose_tab_width = 10;
support_hose_tab_height = 24;
support_hose_tab_slot_length = 10;
support_hose_tab_slot_width = 4;
support_hose_tab_body_gap = 6;
support_hose_tab_slot_center_z = support_beam_height + 6;
support_joint_clearance = 0.25;
support_plan_tab_length = 8;
support_plan_tab_width = 14;
support_driver_spine_width = 52;
support_shelf_tab_width = 14;
support_shelf_tab_offset = 8;
support_label_font = "Liberation Sans:style=Bold";
support_piece_label_depth = 0.6;
support_piece_label_size = 7;
support_small_label_size = 5;
support_slot_label_size = 4.5;

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
support_driver_shelf_y0 = support_rear_panel_y0 + support_rear_panel_thickness;
support_driver_shelf_z0 = support_psu_ref_z0 + support_psu_vertical_size[2] + support_driver_clear_above_psu;
support_driver_ref_x0 = support_driver_shelf_x0;
support_driver_ref_y0 = support_rear_panel_y0 + support_rear_panel_thickness - support_driver_inboard_depth;
support_driver_ref_z0 = support_driver_shelf_z0 + support_driver_shelf_thickness;
support_cradle_x0 = support_body_x0 - support_cradle_overhang;
support_cradle_length = body_length + (2 * support_cradle_overhang);
support_cradle_depth = body_width;
support_display_base_x0 = support_display_panel_x0 - 12;
support_display_base_width = support_display_panel_width + 24;
support_display_base_depth = support_body_y0;
support_rear_deck_x0 = support_rear_panel_x0;
support_rear_deck_length = support_rear_panel_length;
support_rear_deck_depth = (support_width - support_rear_span_y0) + support_plan_tab_length;
support_driver_spine_x0 = (support_length - support_driver_spine_width) / 2;
support_driver_spine_height = support_driver_ref_z0 + support_driver_ref_size[2] + 12;
support_psu_upright_width = 28;
support_psu_upright_height = support_psu_ref_z0 + support_psu_mount_offset_z + 38;
support_psu_upright_x = [
    support_psu_ref_x0 + support_psu_mount_offset_x - (support_psu_upright_width / 2),
    support_psu_ref_x0 + support_psu_vertical_size[0] - support_psu_mount_offset_x - (support_psu_upright_width / 2)
];
support_spine_slot_x = [
    support_shelf_tab_offset,
    support_driver_spine_width - support_shelf_tab_width - support_shelf_tab_offset
];
support_shelf_tab_x = [
    support_driver_spine_x0 + support_spine_slot_x[0] - support_driver_shelf_x0,
    support_driver_spine_x0 + support_spine_slot_x[1] - support_driver_shelf_x0
];
support_keeper_slot_y = [
    support_body_y0 + ((support_rail_width - support_keeper_thickness) / 2),
    support_body_y0 + body_width - support_rail_width + ((support_rail_width - support_keeper_thickness) / 2)
];
support_hose_tab_pair_offset = (plug_root_flange_od / 2) + support_hose_tab_body_gap + support_hose_tab_width;
support_hose_tab_mount_x = [
    support_cradle_x0 + 4,
    support_cradle_x0 + support_cradle_length - support_hose_tab_thickness - 4
];
support_hose_tab_mount_y = [
    support_body_y0 + (body_width / 2) - support_hose_tab_pair_offset,
    support_body_y0 + (body_width / 2) + support_hose_tab_pair_offset - support_hose_tab_width
];

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
prototype_print_gap = 4;
prototype_upright_plug_footprint = plug_root_flange_od;
prototype_packed_hose_bundle_width = (3 * prototype_upright_plug_footprint) + (2 * prototype_print_gap);
prototype_packed_hose_bundle_depth = (2 * prototype_upright_plug_footprint) + prototype_print_gap;

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

module body_outer() {
    cube([body_length, body_width, body_height]);
}

module rounded_slot(slot_length, slot_width, slot_height) {
    slot_offset = (slot_length - slot_width) / 2;

    hull() {
        translate([-slot_offset, 0, 0]) cylinder(h = slot_height, d = slot_width);
        translate([slot_offset, 0, 0]) cylinder(h = slot_height, d = slot_width);
    }
}

module rounded_rect_prism_x(length, size_y, size_z, radius) {
    y_offset = (size_y / 2) - radius;
    z_offset = (size_z / 2) - radius;

    hull() {
        for (y_sign = [-1, 1], z_sign = [-1, 1]) {
            translate([0, y_sign * y_offset, z_sign * z_offset])
                rotate([0, 90, 0])
                    cylinder(h = length, r = radius);
        }
    }
}

module hose_plug_capture_head(clearance = 0) {
    rounded_rect_prism_x(
        plug_capture_head_length + (2 * clearance),
        plug_capture_head_y + (2 * clearance),
        plug_capture_head_z + (2 * clearance),
        plug_capture_head_radius + clearance
    );
}

module hose_plug_local(spigot_od) {
    radius = spigot_od / 2;

    difference() {
        union() {
            translate([-spigot_length + entry_chamfer, 0, 0])
                rotate([0, 90, 0]) cylinder(h = spigot_length - plug_root_flange_thickness - entry_chamfer, r = radius);

            translate([-spigot_length, 0, 0])
                rotate([0, 90, 0]) cylinder(h = entry_chamfer, r1 = radius - entry_chamfer, r2 = radius);

            translate([-spigot_length + bead_offset_from_tip, 0, 0])
                rotate([0, 90, 0]) cylinder(h = spigot_bead_width, r = radius + spigot_bead_height);

            translate([-plug_root_flange_thickness, 0, 0])
                rotate([0, 90, 0]) cylinder(h = plug_root_flange_thickness, d = plug_root_flange_od);

            rotate([0, 90, 0]) cylinder(h = plug_neck_length, d = plug_neck_od);

            translate([plug_neck_length, 0, 0])
                hose_plug_capture_head();
        }

        translate([-spigot_length - boolean_overlap, 0, 0])
            rotate([0, 90, 0])
                cylinder(h = spigot_length + plug_socket_end + (2 * boolean_overlap), d = hose_id);

        translate([-plug_gasket_recess_depth - boolean_overlap, 0, 0])
            rotate([0, 90, 0])
                difference() {
                    cylinder(h = plug_gasket_recess_depth + (2 * boolean_overlap), d = plug_gasket_od);
                    translate([0, 0, -boolean_overlap])
                        cylinder(h = plug_gasket_recess_depth + (4 * boolean_overlap), d = plug_gasket_id);
                }
    }
}

module hose_plug_socket_local() {
    union() {
        translate([-boolean_overlap, 0, 0])
            rotate([0, 90, 0])
                cylinder(h = plug_neck_length + (2 * boolean_overlap), d = plug_throat_d);

        translate([plug_neck_length - boolean_overlap, 0, 0])
            hose_plug_capture_head(plug_socket_clearance);
    }
}

module left_hose_plug(spigot_od) {
    translate([0, spigot_axis_y, spigot_axis_z])
        hose_plug_local(spigot_od);
}

module right_hose_plug(spigot_od) {
    translate([body_length, spigot_axis_y, spigot_axis_z])
        mirror([1, 0, 0]) hose_plug_local(spigot_od);
}

module left_hose_plug_socket() {
    translate([0, spigot_axis_y, spigot_axis_z])
        hose_plug_socket_local();
}

module right_hose_plug_socket() {
    translate([body_length, spigot_axis_y, spigot_axis_z])
        mirror([1, 0, 0]) hose_plug_socket_local();
}

module hose_plug_export_part(spigot_od) {
    translate([
        spigot_length,
        (plug_root_flange_od / 2) + 2,
        (plug_capture_head_z / 2) + 2
    ]) hose_plug_local(spigot_od);
}

module half_mask(z0, z1) {
    translate([-2, -2, z0])
        cube([body_length + 4, body_width + 4, z1 - z0]);
}

module lid_outer() {
    intersection() {
        body_outer();
        half_mask(base_thickness, body_height);
    }
}

module base_outer() {
    intersection() {
        body_outer();
        half_mask(0, base_thickness);
    }
}

module port_bore(x_start, length) {
    translate([x_start, spigot_axis_y, spigot_axis_z])
        rotate([0, 90, 0]) cylinder(h = length, r = bore_radius);
}

module left_port_bore_body() {
    port_bore(
        plug_socket_end - port_bore_x_overlap,
        cavity_x0 - plug_socket_end + (2 * port_bore_x_overlap)
    );
}

module right_port_bore_body() {
    port_bore(
        body_length - cavity_x0 - port_bore_x_overlap,
        cavity_x0 - plug_socket_end + (2 * port_bore_x_overlap)
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
        lid_outer();
        lid_screw_holes();
        lid_hot_side_mount_holes();
        left_hose_plug_socket();
        right_hose_plug_socket();
        left_port_bore_body();
        right_port_bore_body();
        inlet_diffuser();
        outlet_converger();
        channel_array();
    }
}

module base_part(spigot_od = main_spigot_od) {
    difference() {
        base_outer();
        base_screw_holes();
        base_hot_side_mount_holes();
        left_hose_plug_socket();
        right_hose_plug_socket();
        left_port_bore_body();
        right_port_bore_body();
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

module support_label_2d(label_text, size = support_piece_label_size) {
    text(label_text, size = size, halign = "center", valign = "center", font = support_label_font);
}

module support_top_label_cut(label_text, x_pos, y_pos, top_z, size = support_piece_label_size, depth = support_piece_label_depth) {
    translate([x_pos, y_pos, top_z - depth])
        linear_extrude(height = depth + (2 * boolean_overlap))
            support_label_2d(label_text, size);
}

module support_front_label_cut(label_text, x_pos, z_pos, face_y, size = support_piece_label_size, depth = support_piece_label_depth) {
    translate([x_pos, face_y + boolean_overlap, z_pos])
        rotate([90, 0, 0])
            linear_extrude(height = depth + (2 * boolean_overlap))
                support_label_2d(label_text, size);
}

module support_side_label_cut(label_text, y_pos, z_pos, face_x, size = support_piece_label_size, depth = support_piece_label_depth) {
    translate([face_x - depth, y_pos, z_pos])
        rotate([90, 0, 90])
            linear_extrude(height = depth + (2 * boolean_overlap))
                support_label_2d(label_text, size);
}

module support_plan_tabs(x_positions, y_pos, tab_length, tab_width) {
    for (x_pos = x_positions) {
        translate([x_pos, y_pos, 0])
            cube([tab_width, tab_length, support_beam_height]);
    }
}

module support_plan_slots(x_positions, y_pos, tab_length, tab_width) {
    for (x_pos = x_positions) {
        translate([
            x_pos - (support_joint_clearance / 2),
            y_pos - (support_joint_clearance / 2),
            -0.1
        ]) cube([
            tab_width + support_joint_clearance,
            tab_length + support_joint_clearance,
            support_beam_height + 0.2
        ]);
    }
}

module support_cradle_panel_piece() {
    crossmember_x = [
        0,
        support_body_x0 + (body_length / 2) - (support_crossmember_width / 2) - support_cradle_x0,
        support_cradle_length - support_crossmember_width
    ];
    center_crossmember_x = crossmember_x[1] + (support_crossmember_width / 2);
    display_slot_x = [
        support_display_base_x0 - support_cradle_x0 + 14,
        support_display_base_x0 - support_cradle_x0 + support_display_base_width - support_plan_tab_width - 14
    ];
    keeper_slot_x = [
        support_body_x0 + 10 - support_cradle_x0,
        support_body_x0 + body_length - 26 - support_cradle_x0
    ];
    keeper_slot_y = [
        support_keeper_slot_y[0] - support_body_y0,
        support_keeper_slot_y[1] - support_body_y0
    ];
    hose_slot_x = [
        support_hose_tab_mount_x[0] - support_cradle_x0,
        support_hose_tab_mount_x[1] - support_cradle_x0
    ];
    hose_slot_y = [
        support_hose_tab_mount_y[0] - support_body_y0,
        support_hose_tab_mount_y[1] - support_body_y0
    ];

    difference() {
        union() {
            cube([support_cradle_length, support_rail_width, support_beam_height]);
            translate([0, support_cradle_depth - support_rail_width, 0])
                cube([support_cradle_length, support_rail_width, support_beam_height]);

            for (x_pos = crossmember_x) {
                translate([x_pos, 0, 0])
                    cube([support_crossmember_width, support_cradle_depth, support_beam_height]);
            }
        }

        support_plan_slots(display_slot_x, 0, support_plan_tab_length, support_plan_tab_width);
        support_plan_slots(crossmember_x, support_cradle_depth - support_plan_tab_length, support_plan_tab_length, support_crossmember_width);

        for (x_pos = keeper_slot_x, y_pos = keeper_slot_y) {
            translate([
                x_pos - (support_joint_clearance / 2),
                y_pos - (support_joint_clearance / 2),
                -0.1
            ]) cube([
                16 + support_joint_clearance,
                support_keeper_thickness + support_joint_clearance,
                support_beam_height + 0.2
            ]);
        }

        for (x_pos = hose_slot_x, y_pos = hose_slot_y) {
            translate([
                x_pos - (support_joint_clearance / 2),
                y_pos - (support_joint_clearance / 2),
                -0.1
            ]) cube([
                support_hose_tab_thickness + support_joint_clearance,
                support_hose_tab_width + support_joint_clearance,
                support_beam_height + 0.2
            ]);
        }

        support_top_label_cut("A", center_crossmember_x, support_cradle_depth / 2, support_beam_height, 6);
        support_top_label_cut("B", center_crossmember_x, support_rail_width / 2, support_beam_height, support_slot_label_size);
        support_top_label_cut("C", center_crossmember_x, support_cradle_depth - (support_rail_width / 2), support_beam_height, support_slot_label_size);
    }
}

module support_display_base_piece() {
    tab_x = [
        14,
        support_display_base_width - support_plan_tab_width - 14
    ];

    difference() {
        union() {
            cube([support_display_base_width, support_display_base_depth, support_beam_height]);
            support_plan_tabs(tab_x, support_display_base_depth, support_plan_tab_length, support_plan_tab_width);
        }

        translate([
            12 - (support_joint_clearance / 2),
            -(support_joint_clearance / 2),
            -0.1
        ]) cube([
            support_display_panel_width + support_joint_clearance,
            support_display_panel_thickness + support_joint_clearance,
            support_beam_height + 0.2
        ]);

        support_top_label_cut("B", support_display_base_width / 2, support_display_base_depth - 12, support_beam_height, 6);
        support_top_label_cut("D", support_display_base_width / 2, 11, support_beam_height, support_slot_label_size);
    }
}

module support_rear_deck_piece() {
    bridge_x = [
        support_cradle_x0 - support_rear_deck_x0,
        support_body_x0 + (body_length / 2) - (support_crossmember_width / 2) - support_rear_deck_x0,
        support_cradle_x0 + support_cradle_length - support_crossmember_width - support_rear_deck_x0
    ];
    center_bridge_x = bridge_x[1] + (support_crossmember_width / 2);
    rear_rail_y = support_rear_deck_depth - support_rail_width;
    vertical_slot_y = support_rear_panel_y0 - (support_rear_span_y0 - support_plan_tab_length);
    upright_center_x = [
        support_psu_upright_x[0] - support_rear_deck_x0 + (support_psu_upright_width / 2),
        support_psu_upright_x[1] - support_rear_deck_x0 + (support_psu_upright_width / 2)
    ];
    spine_center_x = support_driver_spine_x0 - support_rear_deck_x0 + (support_driver_spine_width / 2);

    difference() {
        union() {
            translate([0, rear_rail_y, 0])
                cube([support_rear_deck_length, support_rail_width, support_beam_height]);

            for (x_pos = bridge_x) {
                translate([x_pos, support_plan_tab_length, 0])
                    cube([support_crossmember_width, support_width - support_rear_span_y0, support_beam_height]);
            }

            support_plan_tabs(bridge_x, 0, support_plan_tab_length, support_crossmember_width);
        }

        for (x_pos = support_psu_upright_x) {
            translate([
                x_pos - support_rear_deck_x0 - (support_joint_clearance / 2),
                vertical_slot_y - (support_joint_clearance / 2),
                -0.1
            ]) cube([
                support_psu_upright_width + support_joint_clearance,
                support_rear_panel_thickness + support_joint_clearance,
                support_beam_height + 0.2
            ]);
        }

        translate([
            support_driver_spine_x0 - support_rear_deck_x0 - (support_joint_clearance / 2),
            vertical_slot_y - (support_joint_clearance / 2),
            -0.1
        ]) cube([
            support_driver_spine_width + support_joint_clearance,
            support_rear_panel_thickness + support_joint_clearance,
            support_beam_height + 0.2
        ]);

        support_top_label_cut("C", center_bridge_x, support_plan_tab_length + 16, support_beam_height, 6);
        support_top_label_cut("E", upright_center_x[0], rear_rail_y + (support_rail_width / 2), support_beam_height, support_slot_label_size);
        support_top_label_cut("E", upright_center_x[1], rear_rail_y + (support_rail_width / 2), support_beam_height, support_slot_label_size);
        support_top_label_cut("F", spine_center_x, rear_rail_y + (support_rail_width / 2), support_beam_height, support_slot_label_size);
    }
}

module support_display_mast_piece() {
    difference() {
        cube([support_display_panel_width, support_display_panel_thickness, support_beam_height + support_display_panel_height]);

        for (dx = [-support_display_slot_pitch / 2, support_display_slot_pitch / 2], dz = [-support_display_slot_pitch / 2, support_display_slot_pitch / 2]) {
            translate([
                (support_display_panel_width / 2) + dx,
                support_display_panel_thickness + 0.1,
                support_display_window_center_z + dz
            ]) rotate([90, 0, 0])
                rounded_slot(support_display_slot_length, support_display_slot_width, support_display_panel_thickness + 0.2);
        }

        for (dx = [-support_controller_slot_pitch / 2, support_controller_slot_pitch / 2]) {
            translate([
                (support_display_panel_width / 2) + dx,
                support_display_panel_thickness + 0.1,
                support_beam_height + support_display_panel_height - 14
            ]) rotate([90, 0, 0])
                rounded_slot(6, support_controller_slot_width, support_display_panel_thickness + 0.2);
        }

        translate([
            support_display_panel_width / 2,
            support_display_panel_thickness + 0.1,
            support_display_window_center_z
        ]) rotate([90, 0, 0])
            cylinder(h = support_display_panel_thickness + 0.2, d = support_display_window_d);

        // Simple square relief below the display window to reduce print mass
        // without changing the mast footprint or mount pattern.
        translate([
            (support_display_panel_width - support_display_relief_width) / 2,
            -0.1,
            support_display_relief_center_z - (support_display_relief_height / 2)
        ]) cube([
            support_display_relief_width,
            support_display_panel_thickness + 0.2,
            support_display_relief_height
        ]);

        support_front_label_cut("D", support_display_panel_width / 2, 10, support_display_panel_thickness, 8);
    }
}

module support_psu_upright_piece() {
    difference() {
        cube([support_psu_upright_width, support_rear_panel_thickness, support_psu_upright_height]);

        translate([
            support_psu_upright_width / 2,
            support_rear_panel_thickness + 0.1,
            support_psu_ref_z0 + support_psu_mount_offset_z
        ]) rotate([90, 0, 0])
            cylinder(h = support_rear_panel_thickness + 0.2, d = support_psu_mount_hole_d);

        support_front_label_cut("E", support_psu_upright_width / 2, 14, support_rear_panel_thickness, 7);
    }
}

module support_driver_spine_piece() {
    driver_cutout_x0 = ((support_driver_spine_width - support_driver_ref_size[0]) / 2) + support_driver_cutout_margin;
    driver_cutout_width = support_driver_ref_size[0] - (2 * support_driver_cutout_margin);
    driver_cutout_z0 = support_driver_ref_z0 + support_driver_cutout_margin;
    driver_cutout_height = support_driver_ref_size[2] - (2 * support_driver_cutout_margin);
    driver_cable_notch_x0 = (support_driver_spine_width - support_driver_cable_notch_width) / 2;
    driver_cable_notch_height = support_driver_cutout_margin + support_driver_cable_notch_height;

    difference() {
        cube([support_driver_spine_width, support_rear_panel_thickness, support_driver_spine_height]);

        translate([
            10,
            -0.1,
            support_beam_height + 16
        ]) cube([
            support_driver_spine_width - 20,
            support_rear_panel_thickness + 0.2,
            support_driver_shelf_z0 - (support_beam_height + 32)
        ]);

        for (x_pos = support_spine_slot_x) {
            translate([
                x_pos - (support_joint_clearance / 2),
                -0.1,
                support_driver_shelf_z0 - (support_joint_clearance / 2)
            ]) cube([
                support_shelf_tab_width + support_joint_clearance,
                support_rear_panel_thickness + 0.2,
                support_driver_shelf_thickness + support_joint_clearance
            ]);
        }

        // Rear-facing driver mount: keep only a narrow land around the screw-hole area,
        // open the center for the capacitor, terminal side, and wire pass-through.
        translate([
            driver_cutout_x0,
            -0.1,
            driver_cutout_z0
        ]) cube([
            driver_cutout_width,
            support_rear_panel_thickness + 0.2,
            driver_cutout_height
        ]);

        translate([
            driver_cable_notch_x0,
            -0.1,
            support_driver_ref_z0 - 0.1
        ]) cube([
            support_driver_cable_notch_width,
            support_rear_panel_thickness + 0.2,
            driver_cable_notch_height + 0.2
        ]);

        support_front_label_cut("F", support_driver_spine_width / 2, 14, support_rear_panel_thickness, 7);
        support_front_label_cut("G", support_driver_spine_width / 2, support_driver_shelf_z0 + 10, support_rear_panel_thickness, support_slot_label_size);
    }
}

module support_driver_shelf_piece() {
    difference() {
        union() {
            cube([support_driver_shelf_width, support_driver_shelf_depth, support_driver_shelf_thickness]);

            for (x_pos = support_shelf_tab_x) {
                translate([x_pos, -support_rear_panel_thickness, 0])
                    cube([support_shelf_tab_width, support_rear_panel_thickness, support_driver_shelf_thickness]);
            }
        }

        support_top_label_cut("G", 12, support_driver_shelf_depth / 2, support_driver_shelf_thickness, 6);
    }
}

module support_keeper_piece() {
    difference() {
        cube([16, support_keeper_thickness, support_keeper_height]);
        support_front_label_cut("K", 8, support_keeper_height / 2, support_keeper_thickness, support_small_label_size);
    }
}

module support_hose_tab_piece() {
    difference() {
        cube([support_hose_tab_thickness, support_hose_tab_width, support_hose_tab_height]);

        translate([
            support_hose_tab_thickness + 0.1,
            support_hose_tab_width / 2,
            support_hose_tab_slot_center_z
        ]) rotate([0, 90, 0])
            rounded_slot(support_hose_tab_slot_length, support_hose_tab_slot_width, support_hose_tab_thickness + 0.2);

        support_side_label_cut("T", support_hose_tab_width / 2, support_hose_tab_height / 2, support_hose_tab_thickness, support_small_label_size);
    }
}

module support_cradle_panel_assembly() {
    translate([support_cradle_x0, support_body_y0, 0])
        support_cradle_panel_piece();
}

module support_display_base_assembly() {
    translate([support_display_base_x0, 0, 0])
        support_display_base_piece();
}

module support_rear_deck_assembly() {
    translate([support_rear_deck_x0, support_rear_span_y0 - support_plan_tab_length, 0])
        support_rear_deck_piece();
}

module support_display_mast_assembly() {
    translate([support_display_panel_x0, 0, 0])
        support_display_mast_piece();
}

module support_psu_upright_assembly(side = "left") {
    x_pos = side == "left" ? support_psu_upright_x[0] : support_psu_upright_x[1];

    translate([x_pos, support_rear_panel_y0, 0])
        support_psu_upright_piece();
}

module support_driver_spine_assembly() {
    translate([support_driver_spine_x0, support_rear_panel_y0, 0])
        support_driver_spine_piece();
}

module support_driver_shelf_assembly() {
    translate([support_driver_shelf_x0, support_driver_shelf_y0, support_driver_shelf_z0])
        support_driver_shelf_piece();
}

module support_keeper_tabs_assembly() {
    tab_x = [
        support_body_x0 + 10,
        support_body_x0 + body_length - 26
    ];

    for (x_pos = tab_x, y_pos = support_keeper_slot_y) {
        translate([x_pos, y_pos, 0])
            support_keeper_piece();
    }
}

module support_hose_tabs_assembly() {
    for (x_pos = support_hose_tab_mount_x, y_pos = support_hose_tab_mount_y) {
        translate([x_pos, y_pos, 0])
            support_hose_tab_piece();
    }
}

module prototype_support_assembly() {
    support_cradle_panel_assembly();
    support_display_base_assembly();
    support_rear_deck_assembly();
    support_display_mast_assembly();
    support_psu_upright_assembly("left");
    support_psu_upright_assembly("right");
    support_driver_spine_assembly();
    support_driver_shelf_assembly();
    support_keeper_tabs_assembly();
    support_hose_tabs_assembly();
}

module prototype_support_part() {
    layout_gap = prototype_print_gap;
    display_base_x = support_rear_deck_length + layout_gap;
    rear_deck_band_y = support_rear_deck_depth + layout_gap;
    hose_tab_pitch = support_hose_tab_height + layout_gap;
    hose_tab_row_x = support_hose_tab_height;
    driver_shelf_x = 4 * hose_tab_pitch;
    row0_height = support_display_base_width;
    row1_y = row0_height + layout_gap;
    display_mast_x = support_cradle_length + layout_gap;
    display_mast_band_y = support_display_panel_width + layout_gap;
    display_mast_rotated_width = support_display_panel_height + support_beam_height;
    upright_rotated_width = support_psu_upright_height;
    upright_rotated_height = support_psu_upright_width;
    first_upright_x = display_mast_x + ((display_mast_rotated_width - upright_rotated_width) / 2);
    row1_height = display_mast_band_y + upright_rotated_height;
    row2_y = row1_y + row1_height + layout_gap;
    driver_spine_rotated_width = support_driver_spine_height;
    second_upright_x = driver_spine_rotated_width + layout_gap;
    keeper_pitch = 16 + layout_gap;
    keeper_row_width = (4 * 16) + (3 * layout_gap);
    keeper_row_x = second_upright_x + ((upright_rotated_width - keeper_row_width) / 2);
    keeper_row_y = row2_y + upright_rotated_height + layout_gap;

    support_rear_deck_piece();

    translate([display_base_x, 0, 0])
        support_display_base_rotated_print_part();

    for (index = [0 : 3]) {
        translate([
            hose_tab_row_x + (index * hose_tab_pitch),
            rear_deck_band_y,
            0
        ]) support_hose_tab_normalized_print_part();
    }

    translate([driver_shelf_x, rear_deck_band_y, 0])
        support_driver_shelf_export();

    translate([0, row1_y, 0])
        support_cradle_panel_piece();

    translate([display_mast_x, row1_y, 0])
        support_display_mast_rotated_print_part();

    translate([first_upright_x, row1_y + display_mast_band_y, 0])
        support_psu_upright_rotated_print_part();

    translate([0, row2_y, 0])
        support_driver_spine_rotated_print_part();

    translate([second_upright_x, row2_y, 0])
        support_psu_upright_rotated_print_part();

    for (index = [0 : 3]) {
        translate([
            keeper_row_x + (index * keeper_pitch),
            keeper_row_y,
            0
        ]) support_keeper_export();
    }
}

module support_cradle_panel_export() {
    support_cradle_panel_piece();
}

module support_display_base_export() {
    support_display_base_piece();
}

module support_rear_deck_export() {
    support_rear_deck_piece();
}

module support_display_mast_export() {
    translate([0, support_beam_height + support_display_panel_height, 0])
        rotate([90, 0, 0]) support_display_mast_piece();
}

module support_psu_upright_export() {
    translate([0, support_psu_upright_height, 0])
        rotate([90, 0, 0]) support_psu_upright_piece();
}

module support_driver_spine_export() {
    translate([0, support_driver_spine_height, 0])
        rotate([90, 0, 0]) support_driver_spine_piece();
}

module support_driver_shelf_export() {
    translate([0, support_rear_panel_thickness, 0]) support_driver_shelf_piece();
}

module support_keeper_export() {
    translate([0, support_keeper_height, 0])
        rotate([90, 0, 0]) support_keeper_piece();
}

module support_hose_tab_export() {
    translate([0, support_hose_tab_height, support_hose_tab_thickness])
        rotate([0, -90, 0]) support_hose_tab_piece();
}

module support_display_base_rotated_print_part() {
    translate([0, support_display_base_width, 0])
        rotate([0, 0, -90]) support_display_base_piece();
}

module support_display_mast_rotated_print_part() {
    translate([0, support_display_panel_width, 0])
        rotate([0, 0, -90]) support_display_mast_export();
}

module support_psu_upright_rotated_print_part() {
    translate([0, support_psu_upright_width, 0])
        rotate([0, 0, -90]) support_psu_upright_export();
}

module support_driver_spine_rotated_print_part() {
    translate([0, support_driver_spine_width, 0])
        rotate([0, 0, -90]) support_driver_spine_export();
}

module support_hose_tab_normalized_print_part() {
    translate([support_hose_tab_height, 0, 0])
        support_hose_tab_export();
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
        ]) cube([support_driver_ref_size[0], support_driver_inboard_depth, support_driver_ref_size[2]]);

    color([0.18, 0.42, 0.24, 0.45])
        translate([
            support_driver_ref_x0,
            support_rear_panel_y0 + support_rear_panel_thickness,
            support_driver_ref_z0
        ]) cube([support_driver_ref_size[0], support_driver_outboard_depth, support_driver_ref_size[2]]);
}

module display_reference() {
    color([0.16, 0.16, 0.16, 0.75])
        translate([
            support_display_center_x - (support_display_board_size / 2),
            support_display_panel_thickness + 0.6,
            support_display_window_center_z - (support_display_board_size / 2)
        ]) cube([support_display_board_size, 2.2, support_display_board_size]);
}

module xiao_reference() {
    color([0.14, 0.46, 0.26, 0.8])
        translate([
            support_display_center_x - 10.5,
            support_display_panel_thickness + 0.6,
            support_beam_height + support_display_panel_height - 24
        ]) cube([21, 2.2, 17.8]);
}

module hose_plug_layout() {
    translate([0, 0, 0]) hose_plug_export_part(main_spigot_od);
    translate([plug_layout_pitch, 0, 0]) hose_plug_export_part(mid_spigot_od);
    translate([2 * plug_layout_pitch, 0, 0]) hose_plug_export_part(small_spigot_od);
}

module coupon(spigot_od, label_text = "") {
    hose_plug_export_part(spigot_od);
}

module coupon_layout() {
    hose_plug_layout();
}

module print_layout() {
    color([0.90, 0.90, 0.90]) base_part();

    color([0.75, 0.80, 0.92])
        translate([0, body_width + layout_gap, -base_thickness])
            lid_part();

    color([0.90, 0.90, 0.90])
        translate([body_length + 36, 0, 0])
            hose_plug_layout();
}

module prototype_base_print_part() {
    base_part();
}

module prototype_lid_print_part() {
    translate([0, 0, body_height])
        mirror([0, 0, 1])
            lid_part();
}

module prototype_hose_plug_print_part(spigot_od) {
    translate([
        plug_root_flange_od / 2,
        plug_root_flange_od / 2,
        plug_socket_end
    ])
        rotate([0, 90, 0])
            hose_plug_local(spigot_od);
}

module prototype_lid_base_bundle() {
    color([0.90, 0.90, 0.90]) prototype_base_print_part();

    color([0.75, 0.80, 0.92])
        translate([body_length + prototype_print_gap, 0, 0])
            prototype_lid_print_part();
}

module prototype_hose_bundle() {
    plug_x_pitch = prototype_upright_plug_footprint + prototype_print_gap;
    plug_y_pitch = prototype_upright_plug_footprint + prototype_print_gap;

    color([0.90, 0.90, 0.90]) {
        for (row = [0 : 1]) {
            translate([0, row * plug_y_pitch, 0]) {
                prototype_hose_plug_print_part(main_spigot_od);

                translate([plug_x_pitch, 0, 0])
                    prototype_hose_plug_print_part(mid_spigot_od);

                translate([2 * plug_x_pitch, 0, 0])
                    prototype_hose_plug_print_part(small_spigot_od);
            }
        }
    }
}

module prototype_hose_lid_base_bundle() {
    hose_bundle_x = (body_length - prototype_packed_hose_bundle_width) / 2;
    hose_bundle_y = (2 * body_width) + (2 * prototype_print_gap);

    color([0.90, 0.90, 0.90]) prototype_base_print_part();

    color([0.75, 0.80, 0.92])
        translate([0, body_width + prototype_print_gap, 0])
            prototype_lid_print_part();

    translate([hose_bundle_x, hose_bundle_y, 0])
        prototype_hose_bundle();
}

module preview() {
    color([0.90, 0.90, 0.90, 1.0]) base_part();
    color([0.76, 0.82, 0.94, 0.8]) lid_part();
    color([0.95, 0.95, 0.95, 1.0]) left_hose_plug(main_spigot_od);
    color([0.95, 0.95, 0.95, 1.0]) right_hose_plug(main_spigot_od);
    landing_outline();
    tec_reference();
    copper_reference();

    translate([body_length + 36, 0, 0])
        color([0.94, 0.94, 0.94]) hose_plug_layout();
}

module prototype_preview() {
    color([0.90, 0.91, 0.92, 1.0]) prototype_support_assembly();

    translate([support_body_x0, support_body_y0, support_beam_height]) {
        color([0.90, 0.90, 0.90, 1.0]) base_part();
        color([0.76, 0.82, 0.94, 0.8]) lid_part();
        color([0.95, 0.95, 0.95, 1.0]) left_hose_plug(main_spigot_od);
        color([0.95, 0.95, 0.95, 1.0]) right_hose_plug(main_spigot_od);
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
} else if (part == "plug_main") {
    hose_plug_export_part(main_spigot_od);
} else if (part == "plug_mid") {
    hose_plug_export_part(mid_spigot_od);
} else if (part == "plug_small") {
    hose_plug_export_part(small_spigot_od);
} else if (part == "coupon_main") {
    hose_plug_export_part(main_spigot_od);
} else if (part == "coupon_mid") {
    hose_plug_export_part(mid_spigot_od);
} else if (part == "coupon_small") {
    hose_plug_export_part(small_spigot_od);
} else if (part == "print_layout") {
    print_layout();
} else if (part == "prototype_lid_base_bundle") {
    prototype_lid_base_bundle();
} else if (part == "prototype_hose_bundle") {
    prototype_hose_bundle();
} else if (part == "prototype_hose_lid_base_bundle") {
    prototype_hose_lid_base_bundle();
} else if (part == "prototype_support") {
    prototype_support_part();
} else if (part == "prototype_support_assembly") {
    prototype_support_assembly();
} else if (part == "prototype_preview") {
    prototype_preview();
} else {
    preview();
}