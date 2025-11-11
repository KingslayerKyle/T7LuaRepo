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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	
	local PrestigeIcon = LUI.UIImage.new()
	PrestigeIcon:setLeftRight( 0, 0, 168, 552 )
	PrestigeIcon:setTopBottom( 1, 1, -456, -72 )
	PrestigeIcon:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PrestigeIcon )
	self.PrestigeIcon = PrestigeIcon
	
	local CallingCard = LUI.UIImage.new()
	CallingCard:setLeftRight( 0, 0, 632, 1352 )
	CallingCard:setTopBottom( 0, 0, 138, 318 )
	CallingCard:linkToElementModel( self, "backgroundId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallingCard:setImage( RegisterImage( GetBackgroundByID( modelValue ) ) )
		end
	end )
	self:addElement( CallingCard )
	self.CallingCard = CallingCard
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( 0, 0, 632, 932 )
	Title:setTopBottom( 0, 0, 15, 60 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Description = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	Description:setLeftRight( 0, 0, 632, 1824 )
	Description:setTopBottom( 0, 0, 60, 90 )
	Description:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	self.resetProperties = function ()
		CallingCard:completeAnimation()
		CallingCard:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		DefaultStateZM = {
			DefaultClip = function ()
				self.resetProperties()
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBackAndUpdateStateOnPreviousMenu( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE", nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Description:close()
		self.PrestigeIcon:close()
		self.CallingCard:close()
		self.Title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

