Summary: Web configuration tool for nagios
Name: lilac
Version:3.0
Release: 31.rgm
License: GPL
Group: Applications/System
URL: http://www.lilacplatform.com/

Source0: %{name}.tar.gz

Requires: rgm-base, mariadb, httpd, mariadb-libs, php, php-mysql, php-pear, php-process, php-xml, nagios >= 3.0
BuildRequires: rpm-macros-rgm

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

# define path
%define datadir 	%{rgm_path}/%{name}-%{version}
%define linkdir		%{rgm_path}/%{name}
# /var/lib/rgm/rgmweb
%define rgmlibdir       %{_sharedstatedir}/rgm/%{name}


%description
The Lilac Platform is a collection of tools to enhance existing open source monitoring applications, written by Lilac Networks. 
Currently the focus is on the Lilac Configurator, a configuration tool written to configure Nagios, a popular Network monitoring application which features:

* Enhanced Nagios 3 timeperiod support
* Multiple template inheritance
* Host templates able to contain services, dependencies, escalations
* Importer which can import existing Nagios configurations and import from a Fruity installation
* Exporter with Nagios process control and backup existing configuration files
* Auto-Discovery tool to quickly add your infrastructure into your Nagios installation

%prep
%setup -n %{name} -T -b 0

%install
cd ..
rm -rf %{buildroot}
install -d -m0755 %{buildroot}%{datadir}
install -d -m0755 %{buildroot}%{_sysconfdir}/httpd/conf.d
cp -afpvr %{name}/* %{buildroot}%{datadir}

# rgm - specific
install -d -m0755 %{buildroot}%{rgmlibdir}
install -d -m0755 %{buildroot}%{rgm_docdir}/httpd
cp -afpvr %{_sourcedir}/%{name}-rgm/* %{buildroot}%{rgmlibdir}
cp -afpv %{_sourcedir}/%{name}-rgm/httpd-lilac.example.conf %{buildroot}%{rgm_docdir}/httpd/
cp -afpv %{_sourcedir}/%{name}-rgm/%{name}-conf.php  %{buildroot}%{datadir}/includes/


%post
ln -nsf %{datadir} %{linkdir}
chown -h nagios:rgm %{linkdir}
if [ -e %{_sysconfdir}/httpd/conf.d/lilac.conf ]; then
    rm -f %{_sysconfdir}/httpd/conf.d/lilac.conf
fi


%clean
rm -rf %{buildroot}


%files
%doc %{rgm_docdir}/httpd/httpd-lilac.example.conf
%defattr(-, nagios, %{rgm_group}, 0755)
%config %{datadir}/includes/lilac-conf.php
%{datadir}
%defattr(-, root, %{rgm_group}, 0644)
%{rgmlibdir}


%changelog
* Thu Sep 02 2021 Alexandre Rocher <arocher@fr.scc.com> - 3.0-31.rgm
- CSS harmonization

* Mon Jul 26 2021 Eric Belhomme <ebelhomme@fr.scc.com> - 3.0-30.rgm
- fix typos on core SQL schema

* Mon Jul 12 2021 Alex Rocher <arocher@fr.scc.com> - 3.0-29.rgm
- Fix: Change JS frameworks to avoid XSS
- Fix: More escaping in HTML tags to avoid XSS 

* Wed Jul 07 2021 Alex Rocher <arocher@fr.scc.com> - 3.0-28.rgm
- Fix: Escape values for all variables used in HTML tags

* Mon Jul 05 2021 Alex Rocher <arocher@fr.scc.com> - 3.0-27.rgm
- Fix: sanitize "Configuration Directory" from lilac configuration tab

* Thu Mar 11 2021 Eric Belhomme <ebelhomme@fr.scc.com> - 3.0-26.rgm
- remove autodiscovery features
- remove the ability to add, modify or delete export jobs
- move httpd lilac config file as example file in /usr/share/doc/rgm/httpd/

* Tue Dec 08 2020 Lucas Fueyo <lfueyo@fr.scc.com> - 3.0-25.rgm
- Modify more commands and templates 
- Add metricbeat queue commands and templates 
- Add elastic index check 

* Tue Oct 27 2020 Samuel Ronciaux <sronciaux@fr.scc.com> - 3.0-24.rgm
- Modify XML export Name to RGM_export_xxxx 

* Thu Oct 22 2020 Eric Belhomme <ebelhomme@fr.scc.com> - 3.0-23.rgm
- add support for:
  - metricbeat systime
  - AirWave

* Mon Jun 03 2020 Lucas FUEYO <lfueyo@fr.scc.com> - 3.0-22.rgm
- Add RGM_CONTAINER Host Template 

* Mon Jun 02 2020 Lucas FUEYO <lfueyo@fr.scc.com> - 3.0-21.rgm
- edit WMI Windows Host Template

* Mon May 11 2020 Samuel RONCIAUX <sronciaux@fr.scc.com> - 3.0-20.rgm
- add HPE ILO Template 

* Thu Feb 13 2020 Eric Belhomme <ebelhomme@fr.scc.com> - 3.0-19.rgm
- add/update commands & templates for:
- o TLS certs
- o Ansible Tower ping API
- o LDAP binding

* Tue Feb 04 2020 Eric Belhomme <ebelhomme@fr.scc.com> - 3.0-18.rgm
- add nagios_bp_status on nagios_command

* Tue Jan 14 2020 Michael Aubertin <maubertin@fr.scc.com> - 3.0-17.rgm
- Update Oracle template

* Tue Jan 14 2020 Michael Aubertin <maubertin@fr.scc.com> - 3.0-16.rgm
- Add elastic network initial templates

* Tue Jan 14 2020 Michael Aubertin <maubertin@fr.scc.com> - 3.0-15.rgm
- Multiple minor fix

* Mon Jan 13 2020 Michael Aubertin <maubertin@fr.scc.com> - 3.0-14.rgm
- Multiple minor fix

* Mon Jan 13 2020 Michael Aubertin <maubertin@fr.scc.com> - 3.0-13.rgm
- Update initial templates (VMware ESX)

* Fri Jan 10 2020 Michael Aubertin <maubertin@fr.scc.com> - 3.0-12.rgm
- Update initial templates

* Wed Sep 25 2019 Samuel RONCIAUX <sronciaux@fr.scc.com> - 3.0-11.rgm
- Update check rgm 4 rgm monitoring

* Wed Sep 25 2019 Michael Aubertin <maubertin@fr.scc.com> - 3.0-10.rgm
- Fix header

* Tue Sep 24 2019 Samuel RONCIAUX <sronciaux@fr.scc.com> - 3.0-9.rgm
- Plilac schema update

* Mon Sep 17 2019 Samuel RONCIAUX <sronciaux@fr.scc.com> - 3.0-8.rgm
- Push Lilac-rgm on good directory

* Mon Sep 16 2019 Samuel RONCIAUX <sronciaux@fr.scc.com> - 3.0-7.rgm
- lilac schema update

* Mon Sep 16 2019 Eric Belhomme <ebelhomme@fr.scc.com> - 3.0-6.rgm
- lilac schema update
- lilac schema no longuer automatically configured. Now it's up to user to manually configure its SQL backend

* Fri Sep 06 2019 Samuel Ronciaux <sronciaux@fr.scc.com> - 3.0-5.rgm
- lilac initial schema update

* Mon May 06 2019 Eric Belhomme <ebelhomme@fr.scc.com> - 3.0-4.rgm
- add defaut user group in schema

* Fri May 03 2019 Michael Aubertin <maubertin@fr.scc.com> - 3.0-3.rgm
- fix Lilac SQL procedure

* Tue Apr 30 2019 Eric Belhomme <ebelhomme@fr.scc.com> - 3.0-2.rgm
- fix Lilac SQL schema for nagflux (commands and core config)

* Thu Apr 25 2019 Eric Belhomme <ebelhomme@fr.scc.com> - 3.0-1.rgm
- introduce SQL stored procedures to handle nagios contacts from rgmweb
- SQL schema updates with default contact group on root templates

* Wed Apr 24 2019 Eric Belhomme <ebelhomme@fr.scc.com> - 3.0-0.rgm
- upgrade to lilac 3.0 from upstream
- backport style tweaks from 2.5-4.rgm

* Thu Mar 28 2019 Eric Belhomme <ebelhomme@fr.scc.com> - 2.5-4.rgm
- the provided SQL schema AUTO_INCREMENTS are now dynamically set at %post section
  (use lilac_* scripts from rgm-base package)

* Thu Mar 19 2019 Eric Belhomme <ebelhomme@fr.scc.com> - 2.5-3.rgm
- fix mariadb dependency to mariadb-libs

* Thu Mar 14 2019 Eric Belhomme <ebelhomme@fr.scc.com> - 2.5-2.rgm
- SQL schema sanitization (removal of table garbage, update all table charsets to UTF8)
- adds rgm-base package dependency
- fix config files variables (sql user, passwd, db, etc) by RGM macros

* Mon Mar 04 2019 Michael Aubertin <maubertin@fr.scc.com> - 2.5-1.rgm
- Initial fork
- Validate CI.

* Thu Jan 19 2017 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.5-1.eon
- packaged for EyesOfNetwork appliance 5.1

* Mon Jul 04 2016 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.5-0.eon
- new bootstrap look

* Mon May 09 2016 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.4-5.eon
- various css fixes

* Tue May 19 2015 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.4-4.eon
- xml importer exceptions and options fix

* Mon May 12 2014 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.4-3.eon
- xml importer options

* Mon Jan 06 2014 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.4-2.eon
- display_name if null fix
- nmap add all host fix

* Thu Jul 18 2013 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.4-1.eon
- Template instead of Service To Inherit From in add service page fix

* Wed Jun 19 2013 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.4-0.eon
- packaged for EyesOfNetwork appliance 4.0
- add_host with templates
- add_service with templates, commands and arguments 

* Tue Jan 22 2013 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.3-6.eon
- performance templates max size 500

* Mon Jul 30 2012 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.3-5.eon
- set display_name null if not set fix

* Tue May 29 2012 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.3-4.eon
- eon_notifier commands added
- set display_name null if not set
- $user$ order in resources page fix

* Mon Feb 27 2012 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.3-3.eon
- HostTemplate ContactMembers import fix

* Fri Sep 16 2011 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.3-2.eon
- import/export job next id display added
- autodiscovery/import/export job delete confirmation fix

* Mon Aug 01 2011 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.3-1.eon
- multiple hostgroups/parents/templates disassociations added

* Wed Jul 20 2011 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.3-0.eon
- multiple hostgroups/parents/templates associations added
- ajax search on object associations added
- modify on check command parameters added

* Wed May 11 2011 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.2-1.eon
- body onload checkbox fix
- reset.css * fix

* Thu Apr 21 2011 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.2-0.eon
- exports / imports console clients added
- contactgroups hover fix
- collapse css fix

* Sun Apr 17 2011 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.1-0.eon
- objects exports / imports added
- multiple actions on search results added
- hover on selections added

* Fri Feb 18 2011 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.0-6.eon
- community website update

* Fri Jan 07 2011 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.0-5.eon
- confirmation message syntax fix

* Mon Dec 13 2010 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.0-4.eon
- host parent fix

* Sun Nov 07 2010 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.0-3.eon
- command description in service parameters added
- service template add contact fix
- host add contactgroup fix 

* Thu Oct 21 2010 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.0-2.eon
- nagios importer fix
- address in network view

* Mon Sep 06 2010 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.0-1.eon
- autodiscovery.php templates order fix
- timeperiods clone fix

* Wed Jul 28 2010 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 2.0-0.eon
- packaged for EyesOfNetwork appliance 2.2
- delete and clone on multiple objects
- livestatus configuration
- fruity & nagios importers fix

* Tue Feb 23 2010 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 1.0.3-1.eon
- nagios_only export job 
- fruity importer hostgroups fix
- hosts.php fix
- command name null fix
- order by name fix

* Tue Oct 13 2009 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 1.0.3-0.eon
- 1.0.2 to 1.0.3

* Mon Apr 20 2009 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 1.0.2-0.eon
- 1.0.1 to 1.0.2

* Wed Apr 15 2009 Jean-Philippe Levy <jeanphilippe.levy@gmail.com> - 1.0.1-0.eon
- packaged for EyesOfNetwork 2.0
