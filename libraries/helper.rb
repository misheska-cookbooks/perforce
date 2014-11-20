module Perforce
  # Helper methods for use in the Perforce recipe
  module Helper
    def root_group
      if %w( mac_os_x mac_os_x_server ).include?(node['platform'])
        'wheel'
      elsif ['windows'].include?(node['platform'])
        query = 'select * from Win32_Group where '\
                "SID = 'S-1-5-32-544' AND LocalAccount=TRUE"
        wmi_property_from_query(:name, query)
      else
        'root'
      end
    end

    def p4_os_directory
      arch = node['kernel']['machine'] == 'x86_64' ? 'x86_64' : 'x86'
      case node['os']
      when 'linux' then os = "linux26#{arch}"
      when 'darwin' then os = "darwin90#{arch}"
      when 'windows'
        arch = node['kernel']['machine'] == 'x86_64' ? 'x64' : 'x86'
        os = "nt#{arch}"
      end
      "bin.#{os}"
    end

    def get_p4d_url(version)
      "ftp://ftp.perforce.com/perforce/r#{version}/#{get_p4_os_directory}/p4d"
    end

    def get_p4v_url(version)
      "ftp://ftp.perforce.com/perforce/r#{version}/"\
      "#{get_p4_os_directory}/p4vinst64.exe"
    end

    def get_p4_url(version)
      case node['os']
      when 'linux'
        return "ftp://ftp.perforce.com/perforce/r#{version}"\
               "/#{get_p4_os_directory}/p4"
      end
    end

    def local_path_from_url(url)
      ::File.join(Chef::Config[:file_cache_path], ::File.basename(url))
    end
  end
end
