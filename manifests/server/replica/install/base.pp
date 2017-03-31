# FreeIPA templating module by James
# Copyright (C) 2012-2013+ James Shubin
# Written by James Shubin <james@shubin.ca>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

class ipa::server::replica::install::base {

  include ipa::server::replica::base
  include ipa::vardir
  #$vardir = $::ipa::vardir::module_vardir	# with trailing slash
  $vardir = regsubst($::ipa::vardir::module_vardir, '\/$', '')

  file { "${vardir}/replica/install/":
    ensure  => directory,    # make sure this is a directory
    recurse => true,    # recursively manage directory
    purge   => true,      # purge all unmanaged files
    force   => true,      # also purge subdirs and links
    owner   => root,
    group   => nobody,
    mode    => '0600',
    backup  => false,
    require => File["${vardir}/replica/"],
  }
}

# vim: ts=8
