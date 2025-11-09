CoD.SteamWorkshopUtility = {}
CoD.SteamWorkshopUtility.SetPublishSteamAgreement = function ( f1_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishSteamAgreement" ), f1_arg0 )
end

CoD.SteamWorkshopUtility.GetPublishSteamAgreement = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishSteamAgreement" ) )
end

CoD.SteamWorkshopUtility.SetPublishSteamId = function ( f3_arg0 )
	Engine.SetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishSteamWorkshopId" ), f3_arg0 )
end

CoD.SteamWorkshopUtility.GetPublishSteamId = function ()
	return Engine.GetModelValue( Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishSteamWorkshopId" ) )
end

CoD.SteamWorkshopUtility.OpenPublishPrompt = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
	CoD.FileshareUtility.SetCurrentCategory( f5_arg2 )
	CoD.FileshareUtility.PublishCallback = f5_arg4
	CoD.FileshareUtility.SetPublishName( f5_arg3 )
	CoD.FileshareUtility.SetPublishDescription( "" )
	CoD.FileshareUtility.SetPublishTags( "" )
	CoD.SteamWorkshopUtility.SetPublishSteamAgreement( false )
	CoD.SteamWorkshopUtility.SetPublishSteamId( 0 )
	CoD.FileshareUtility.ResetPublishingModel()
	f5_arg0:openPopup( "SteamWorkshopPublish", f5_arg1 )
end

CoD.SteamWorkshopUtility.Publish = function ( f6_arg0, f6_arg1, f6_arg2 )
	if CoD.FileshareUtility.PublishCallback == nil then
		return 
	else
		CoD.FileshareUtility.PublishCallback( f6_arg2 )
	end
end

CoD.SteamWorkshopUtility.OpenAgreement = function ( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = "read" .. " agreement."
end

CoD.SteamWorkshopUtility.OpenFAQ = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = "read" .. " FAQ."
end

CoD.SteamWorkshopUtility.OpenItemOnSteam = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = "read" .. " FAQ."
end

CoD.SteamWorkshopUtility.ViewWorkshop = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = "read" .. " FAQ."
end

