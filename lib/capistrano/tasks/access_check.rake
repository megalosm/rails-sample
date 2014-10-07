desc "Check that we can access everything"
#set :whenever_command, [:bundle]
#
task :check_write_permissions do
  on roles(:all) do |host|
    # run "ruby -v"
    # test("ruby -v")
    # test("which ruby")
    # test("which gem")
    # test("gem query --local")
    # test("rake -V")
    test("bundler -v")
    # test("env")
    # test("rails -v")
    # test("gem environment")
    # if test("[ -w #{testfetch(:deploy_to)} ]")
    #   info "#{fetch(:deploy_to)} is writable on #{host}"
    # else
    #   error "#{fetch(:deploy_to)} is not writable on #{host}"
    # end
  end
end