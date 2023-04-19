# Bug of obtaining specs after reset

## run on a reproducible platform

Bundler does not install native on any operating system. I reproduce easily using a container like:

```
podman run --rm -ti -u 0 --entrypoint /bin/bash quay.io/centos7/ruby-27-centos7
```

## pepare sources and gems

```
git clone https://github.com/akostadinov/bundler-native-platform-issue
cd bundler-native-platform-issue
gem install bundler -v "2.4.12"
bundle config set --local deployment 'true'
bundle install
```

## make sure a native platform gem was installed

```
bundle show nokogiri
/.../gems/nokogiri-1.13.10-x86_64-linux
```

## run examples

```
bundle exec ruby good.rb
bundle exec ruby bad.rb
```

## result

The `good` command is successful. But the `bad` command fails with:
```
Traceback (most recent call last):
	2: from bad.rb:5:in `<main>'
	1: from /opt/rh/rh-ruby27/root/usr/local/share/gems/gems/bundler-2.4.12/lib/bundler/definition.rb:256:in `specs_for'
/opt/rh/rh-ruby27/root/usr/local/share/gems/gems/bundler-2.4.12/lib/bundler/definition.rb:524:in `materialize': Could not find nokogiri-1.13.10, mini_portile2-2.8.1 in locally installed gems (Bundler::GemNotFound)
```
