CoD.SteamWorkshopUtility = {}
CoD.SteamWorkshopUtility.SetPublishSteamAgreement = function ( val )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishSteamAgreement" )
	Engine.SetModelValue( model, val )
end

CoD.SteamWorkshopUtility.GetPublishSteamAgreement = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishSteamAgreement" )
	return Engine.GetModelValue( model )
end

CoD.SteamWorkshopUtility.SetPublishSteamId = function ( val )
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishSteamWorkshopId" )
	Engine.SetModelValue( model, val )
end

CoD.SteamWorkshopUtility.GetPublishSteamId = function ()
	local model = Engine.CreateModel( CoD.FileshareUtility.GetRootModel(), "publishSteamWorkshopId" )
	return Engine.GetModelValue( model )
end

CoD.SteamWorkshopUtility.OpenPublishPrompt = function ( menu, controller, category, initialItemName, publishActionCallback )
	CoD.FileshareUtility.SetCurrentCategory( category )
	CoD.FileshareUtility.PublishCallback = publishActionCallback
	CoD.FileshareUtility.SetPublishName( initialItemName )
	CoD.FileshareUtility.SetPublishDescription( "" )
	CoD.FileshareUtility.SetPublishTags( "" )
	CoD.SteamWorkshopUtility.SetPublishSteamAgreement( false )
	CoD.SteamWorkshopUtility.SetPublishSteamId( 0 )
	CoD.FileshareUtility.ResetPublishingModel()
	menu:openPopup( "SteamWorkshopPublish", controller )
end

CoD.SteamWorkshopUtility.Publish = function ( self, element, controller )
	if CoD.FileshareUtility.PublishCallback == nil then
		return 
	else
		CoD.FileshareUtility.PublishCallback( controller )
	end
end

CoD.SteamWorkshopUtility.OpenAgreement = function ( self, element, controller )
	local hello = "read"
	hello = hello .. " agreement."
end

CoD.SteamWorkshopUtility.OpenFAQ = function ( self, element, controller )
	local hello = "read"
	hello = hello .. " FAQ."
end

CoD.SteamWorkshopUtility.OpenItemOnSteam = function ( self, element, controller )
	local hello = "read"
	hello = hello .. " FAQ."
end

CoD.SteamWorkshopUtility.ViewWorkshop = function ( self, element, controller )
	local hello = "read"
	hello = hello .. " FAQ."
end

