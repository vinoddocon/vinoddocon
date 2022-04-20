require 'xcodeproj'
path_to_project = "Pods.xcodeproj"
project = Xcodeproj::Project.open(path_to_project)
main_target = project.targets.first
puts "all targets ----> #{project.targets}"
phase = main_target.new_shell_script_build_phase("SwiftGen Script")
phase.shell_script = "$PODS_ROOT/SwiftGen/bin/swiftgen config run"
project.save()
print "successfully done with script swiftgen"
