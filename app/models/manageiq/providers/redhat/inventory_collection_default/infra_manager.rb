class ManageIQ::Providers::Redhat::InventoryCollectionDefault::InfraManager < ManagerRefresh::InventoryCollectionDefault::InfraManager
  class << self
    def vms(extra_attributes = {})
      attributes = {
        :model_class                 => ::ManageIQ::Providers::Redhat::InfraManager::Vm,
        :inventory_object_attributes => [
          :type,
          :ems_ref,
          :ems_ref_obj,
          :uid_ems,
          :connection_state,
          :vendor,
          :name,
          :location,
          :template,
          :memory_reserve,
          :raw_power_state,
          :boot_time,
          :host,
          :ems_cluster,
          :storages,
          :storage,
          :snapshots
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def miq_templates(extra_attributes = {})
      attributes = {
        :model_class                 => ::ManageIQ::Providers::Redhat::InfraManager::Template,
        :inventory_object_attributes => [
          :type,
          :ems_ref,
          :ems_ref_obj,
          :uid_ems,
          :connection_state,
          :vendor,
          :name,
          :location,
          :template,
          :memory_reserve,
          :raw_power_state,
          :boot_time,
          :host,
          :ems_cluster,
          :storages,
          :storage,
          :snapshots
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def disks(extra_attributes = {})
      attributes = {
        :model_class                 => ::Disk,
        :inventory_object_attributes => [
          :device_name,
          :device_type,
          :controller_type,
          :present,
          :filename,
          :location,
          :size,
          :size_on_disk,
          :disk_type,
          :mode,
          :bootable,
          :storage
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def networks(extra_attributes = {})
      attributes = {
        :model_class                 => ::Network,
        :inventory_object_attributes => [
          :description,
          :hostname,
          :ipaddress,
          :subnet_mask,
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def host_networks(extra_attributes = {})
      attributes = {
        :model_class                 => ::Network,
        :inventory_object_attributes => [
          :description,
          :hostname,
          :ipaddress,
          :subnet_mask
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def guest_devices(extra_attributes = {})
      attributes = {
        :model_class                 => ::GuestDevice,
        :inventory_object_attributes => [
          :address,
          :controller_type,
          :device_name,
          :device_type,
          :lan,
          :location,
          :network,
          :present,
          :switch,
          :uid_ems
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def hardwares(extra_attributes = {})
      attributes = hardwares_attributes

      super(attributes.merge!(extra_attributes))
    end

    def host_hardwares(extra_attributes = {})
      attributes = hardwares_attributes

      super(attributes.merge!(extra_attributes))
    end

    def snapshots(extra_attributes = {})
      attributes = {
        :model_class                 => ::Snapshot,
        :inventory_object_attributes => [
          :uid_ems,
          :uid,
          :parent_uid,
          :name,
          :description,
          :create_time,
          :current,
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def operating_systems(extra_attributes = {})
      attributes = operating_systems_attributes

      super(attributes.merge!(extra_attributes))
    end

    def host_operating_systems(extra_attributes = {})
      attributes = operating_systems_attributes

      super(attributes.merge!(extra_attributes))
    end

    def custom_attributes(extra_attributes = {})
      attributes = {
        :model_class                 => ::CustomAttribute,
        :inventory_object_attributes => [
          :section,
          :name,
          :value,
          :source,
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def datacenters(extra_attributes = {})
      attributes = {
        :model_class                 => ::Datacenter,
        :inventory_object_attributes => [
          :name,
          :type,
          :uid_ems,
          :ems_ref,
          :ems_ref_obj,
        ],
        :association                 => :datacenters,
        :builder_params              => {
          :ems_id => ->(persister) { persister.manager.id },
        },
      }

      attributes.merge!(extra_attributes)
    end

    def vm_folders(extra_attributes = {})
      attributes = {
        :model_class                 => ::EmsFolder,
        :inventory_object_attributes => [
          :name,
          :type,
          :uid_ems,
          :hidden
        ],
        :association                 => :vm_folders,
        :manager_ref                 => [:uid_ems],
        :attributes_blacklist        => [:ems_children],
        :builder_params              => {
          :ems_id => ->(persister) { persister.manager.id },
        },
      }

      attributes.merge!(extra_attributes)
    end

    def host_folders(extra_attributes = {})
      attributes = {
        :model_class                 => ::EmsFolder,
        :inventory_object_attributes => [
          :name,
          :type,
          :uid_ems,
          :hidden
        ],
        :association                 => :host_folders,
        :manager_ref                 => [:uid_ems],
        :attributes_blacklist        => [:ems_children],
        :builder_params              => {
          :ems_id => ->(persister) { persister.manager.id },
        },
      }

      attributes.merge!(extra_attributes)
    end

    def root_folders(extra_attributes = {})
      attributes = {
        :model_class                 => ::EmsFolder,
        :inventory_object_attributes => [
          :name,
          :type,
          :uid_ems,
          :hidden
        ],
        :association                 => :root_folders,
        :manager_ref                 => [:uid_ems],
        :attributes_blacklist        => [:ems_children],
        :builder_params              => {
          :ems_id => ->(persister) { persister.manager.id },
        },
      }

      attributes.merge!(extra_attributes)
    end

    def resource_pools(extra_attributes = {})
      attributes = {
        :model_class                 => ::ResourcePool,
        :inventory_object_attributes => [
          :name,
          :uid_ems,
          :is_default,
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def ems_clusters(extra_attributes = {})
      attributes = {
        :model_class                 => ::EmsCluster,
        :inventory_object_attributes => [
          :ems_ref,
          :ems_ref_obj,
          :uid_ems,
          :name,
          :datacenter_id,
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def storages(extra_attributes = {})
      attributes = {
        :model_class                 => ::Storage,
        :inventory_object_attributes => [
          :ems_ref,
          :ems_ref_obj,
          :name,
          :store_type,
          :storage_domain_type,
          :total_space,
          :free_space,
          :uncommitted,
          :multiplehostaccess,
          :location,
          :master
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def hosts(extra_attributes = {})
      attributes = {
        :model_class                 => ::ManageIQ::Providers::Redhat::InfraManager::Host,
        :inventory_object_attributes => [
          :type,
          :ems_ref,
          :ems_ref_obj,
          :name,
          :hostname,
          :ipaddress,
          :uid_ems,
          :vmm_vendor,
          :vmm_product,
          :vmm_version,
          :vmm_buildnumber,
          :connection_state,
          :power_state,
          :ems_cluster,
          :ipmi_address
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def host_storages(extra_attributes = {})
      attributes = {
        :model_class                 => ::HostStorage,
        :inventory_object_attributes => [
          :host,
          :storage,
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def host_switches(extra_attributes = {})
      attributes = {
        :model_class                 => ::HostSwitch,
        :inventory_object_attributes => [
          :host,
          :switch,
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def switches(extra_attributes = {})
      attributes = {
        :model_class                 => ::Switch,
        :inventory_object_attributes => [
          :uid_ems,
          :name,
          :lans
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def lans(extra_attributes = {})
      attributes = {
        :model_class                 => ::Lan,
        :inventory_object_attributes => [
          :name,
          :uid_ems,
          :tag
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def ems_folder_children(extra_attributes = {})
      folder_children_save_block = lambda do |ems, inventory_collection|
        cluster_collection = inventory_collection.dependency_attributes[:clusters].try(:first)
        vm_collection = inventory_collection.dependency_attributes[:vms].try(:first)
        template_collection = inventory_collection.dependency_attributes[:templates].try(:first)
        datacenter_collection = inventory_collection.dependency_attributes[:datacenters].try(:first)

        datacenter_collection.data.each do |dc|
          uid = dc.uid_ems

          clusters = cluster_collection.data.select { |cluster| cluster.datacenter_id == uid }
          cluster_refs = clusters.map(&:ems_ref)

          vms = vm_collection.data.select { |vm| cluster_refs.include? vm.ems_cluster.ems_ref }
          templates = template_collection.data.select { |t| cluster_refs.include? t.ems_cluster.ems_ref }

          ActiveRecord::Base.transaction do
            host_folder = EmsFolder.find_by(:uid_ems => "#{uid}_host")
            cs = EmsCluster.find(clusters.map(&:id))
            cs.each do |c|
              host_folder.with_relationship_type("ems_metadata") { host_folder.add_child c }
            end

            vm_folder = EmsFolder.find_by(:uid_ems => "#{uid}_vm")
            vs = VmOrTemplate.find(vms.map(&:id))
            vs.each do |v|
              vm_folder.with_relationship_type("ems_metadata") { vm_folder.add_child v }
            end

            ts = MiqTemplate.find(templates.map(&:id))
            ts.each do |t|
              vm_folder.with_relationship_type("ems_metadata") { vm_folder.add_child t }
            end

            datacenter = EmsFolder.find(dc.id)
            datacenter.with_relationship_type("ems_metadata") { datacenter.add_child host_folder }
            datacenter.with_relationship_type("ems_metadata") { datacenter.add_child vm_folder }
            root_dc = EmsFolder.find_by(:uid_ems => 'root_dc', :ems_id => ems.id)
            root_dc.with_relationship_type("ems_metadata") { root_dc.add_child datacenter }
            ems.with_relationship_type("ems_metadata") { ems.add_child root_dc }
          end
        end
      end

      attributes = {
        :association       => :ems_folder_children,
        :custom_save_block => folder_children_save_block,
      }

      attributes.merge!(extra_attributes)
    end

    def ems_clusters_children(extra_attributes = {})
      ems_cluster_children_save_block = lambda do |_ems, inventory_collection|
        cluster_collection = inventory_collection.dependency_attributes[:clusters].try(:first)
        vm_collection = inventory_collection.dependency_attributes[:vms].try(:first)

        cluster_collection.each do |cluster|
          vms = vm_collection.data.select { |vm| cluster.ems_ref == vm.ems_cluster.ems_ref }

          ActiveRecord::Base.transaction do
            vs = VmOrTemplate.find(vms.map(&:id))
            rp = ResourcePool.find_by(:uid_ems => "#{cluster.uid_ems}_respool")
            vs.each do |v|
              rp.with_relationship_type("ems_metadata") { rp.add_child v }
            end
            c = EmsCluster.find(cluster.id)
            c.with_relationship_type("ems_metadata") { c.add_child rp }
          end
        end
      end

      attributes = {
        :association       => :ems_cluster_children,
        :custom_save_block => ems_cluster_children_save_block,
      }

      attributes.merge!(extra_attributes)
    end

    private

    def hardwares_attributes
      {
        :model_class                 => ::Hardware,
        :inventory_object_attributes => [
          :annotation,
          :cpu_cores_per_socket,
          :cpu_sockets,
          :cpu_speed,
          :cpu_total_cores,
          :cpu_type,
          :guest_os,
          :manufacturer,
          :memory_mb,
          :model,
          :networks,
          :number_of_nics
        ]
      }
    end

    def operating_systems_attributes
      {
        :model_class                 => ::OperatingSystem,
        :inventory_object_attributes => [
          :name,
          :product_name,
          :product_type,
          :system_type,
          :version
        ]
      }
    end
  end
end
