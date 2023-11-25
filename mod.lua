function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		    {
		        name = "Kaleut",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "deutschland", "germany", "schweiz", "db", "waggon", "goods", "Intermodal", },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },
	  
		params = {
			{
				key = "t2000fake",
				name = _("Fake_t2000_wagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_wagen_desc"),
				defaultIndex = 0,
			},	
        },
	},
	options = {
	},
	
	runFn = function (settings, modParams)
	local params = modParams[getCurrentModId()]

        local hidden = {
			["aae_fake.mdl"] = true,
			["aae_fake_container.mdl"] = true,
			["aae_fake_trailer.mdl"] = true,
			["kombiverkehr_fake.mdl"] = true,
			["kombiverkehr_fake_container.mdl"] = true,
			["kombiverkehr_fake_trailer.mdl"] = true,
			["txlogistik_fake.mdl"] = true,
			["txlogistik_fake_container.mdl"] = true,
			["txlogistik_fake_trailer.mdl"] = true,
			["vtg_fake.mdl"] = true,
			["vtg_fake_container.mdl"] = true,
			["vtg_fake_trailer.mdl"] = true,
			["wascosa_fake.mdl"] = true,
			["wascosa_fake_container.mdl"] = true,
			["wascosa_fake_trailer.mdl"] = true,
			["wascosa2_fake.mdl"] = true,
			["wascosa2_fake_container.mdl"] = true,
			["wascosa2_fake_trailer.mdl"] = true,
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/t2000_([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["t2000fake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end
		
		addModifier( "loadModel", metadataHandler )
	end
	}
end
