# is_mongodb_master
#
# Returns:
#   true  : node is a mongodb primary
#   false : node is not a mongodb primary. its either a secondary, an
#           arbiter, or mongodb is not installed
#
require 'facter'

Facter.add(:is_mongodb_master) do
    setcode do
        Facter::Util::Resolution.exec(
            "mongo --quiet --eval 'rs.isMaster().ismaster'"
        ) == "true"
    end
end
