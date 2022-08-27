-- 240e238f3c4c825a4d5486e68bc6c536
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )

CoD.systemOverlay_PrestigeFanfare = InheritFrom( LUI.UIElement )
CoD.systemOverlay_PrestigeFanfare.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_PrestigeFanfare )
	self.id = "systemOverlay_PrestigeFanfare"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	
	local PrestigeIcon = LUI.UIImage.new()
	PrestigeIcon:setLeftRight( true, false, 112, 368 )
	PrestigeIcon:setTopBottom( false, true, -304, -48 )
	PrestigeIcon:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			PrestigeIcon:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( PrestigeIcon )
	self.PrestigeIcon = PrestigeIcon
	
	local CallingCard = LUI.UIImage.new()
	CallingCard:setLeftRight( true, false, 421, 901 )
	CallingCard:setTopBottom( true, false, 92, 212 )
	CallingCard:linkToElementModel( self, "backgroundId", true, function ( model )
		local backgroundId = Engine.GetModelValue( model )
		if backgroundId then
			CallingCard:setImage( RegisterImage( GetBackgroundByID( backgroundId ) ) )
		end
	end )
	self:addElement( CallingCard )
	self.CallingCard = CallingCard
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 421, 621 )
	Title:setTopBottom( true, false, 10, 40 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Title:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Description = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	Description:setLeftRight( true, false, 421, 1216 )
	Description:setTopBottom( true, false, 40, 60 )
	Description:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			Description.text:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		DefaultStateZM = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				CallingCard:completeAnimation()
				self.CallingCard:setAlpha( 0 )
				self.clipFinished( CallingCard, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DefaultStateZM",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToEnum( element, controller, "prestigeGameMode", Enum.eModes.MODE_ZOMBIES )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "prestigeGameMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "prestigeGameMode"
		} )
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		GoBackAndUpdateStateOnPreviousMenu( self, f10_arg2 )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Description:close()
		element.PrestigeIcon:close()
		element.CallingCard:close()
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

