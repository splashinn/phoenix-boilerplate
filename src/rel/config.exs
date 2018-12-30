~w(rel plugins *.exs)
|> Path.join()
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env()

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"KKTZfNn=SV@fD$9sob>%qaIzM*Di_FAD/n~bBB26P9O{i:BRvTy5C;BB"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"C4D>N10TlgFWX5BIU]mBHAS^~OGNN[f{1XFTiXG*Lq,W^!=ajjU/?%!@"
  set vm_args: "rel/vm.args"
  set pre_start_hooks: "rel/hooks/pre_start"
end

release :web_app do
  set version: current_version(:web_app)
  set applications: [
    :runtime_tools
  ]
end

