# Server values
default['perforce']['p4d']['version'] = '14.2'
default['perforce']['p4d']['user'] = 'perforce'
default['perforce']['p4d']['group'] = 'perforce'
default['perforce']['p4d']['host'] = 'localhost'
# Directory in which the Perforce service stores its files and subdirectories
default['perforce']['p4d']['p4root'] = '/usr/local/p4root'
# Name and path of the file that holds the Perforce database's journal data
default['perforce']['p4d']['p4journal'] = '/var/log/p4d/journal'
# Name and path of the file to which Perforce errors are written
default['perforce']['p4d']['p4log'] = '/var/log/p4d/p4err'

default['perforce']['p4port'] = 'localhost:1666'
default['perforce']['version'] = '14.2'
