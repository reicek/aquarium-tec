import os
import subprocess
import sys
import FreeCAD
import Part


def run_command(command):
    completed = subprocess.run(command, check=False)
    if completed.returncode != 0:
        raise RuntimeError("Command failed with exit code {}: {}".format(completed.returncode, " ".join(command)))


def make_shape_from_stl(stl_path):
    import Mesh

    mesh = Mesh.Mesh(stl_path)
    shape = Part.Shape()
    shape.makeShapeFromMesh(mesh.Topology, 0.05)

    try:
        shell = Part.Shell(shape.Faces)
        solid = Part.makeSolid(shell)
        if not solid.isNull():
            return solid
    except Exception:
        pass

    return shape


def export_step(shape, output_step):
    export_document = FreeCAD.newDocument("step_export")
    feature = export_document.addObject("Part::Feature", "ExportPart")
    feature.Shape = shape
    export_document.recompute()
    Part.export([feature], output_step)
    FreeCAD.closeDocument(export_document.Name)


def main():
    args = sys.argv[1:]
    if args and args[0] == "--pass":
        args = args[1:]

    if len(args) < 4:
        raise SystemExit(
            "Usage: FreeCADCmd export_step_from_scad.py <openscad_exe> <input_scad> <output_step> <output_csg> [output_stl]"
        )

    openscad_exe = args[0]
    input_scad = args[1]
    output_step = args[2]
    output_csg = args[3]
    output_stl = args[4] if len(args) > 4 else os.path.splitext(output_step)[0] + ".stl"

    for path in (output_step, output_csg, output_stl):
        os.makedirs(os.path.dirname(path), exist_ok=True)

    run_command([openscad_exe, "-o", output_csg, input_scad])
    run_command([openscad_exe, "-o", output_stl, input_scad])
    shape = make_shape_from_stl(output_stl)

    export_step(shape, output_step)
    print("Generated CSG and STL from:", input_scad)
    print("Exported STEP:", output_step)


if __name__ == "__main__":
    main()