require( "ui.uieditor.widgets.Pregame.Pregame_DraftedContainer" )

CoD.Competitive_CharacterDraft_Drafted = InheritFrom( LUI.UIElement )
CoD.Competitive_CharacterDraft_Drafted.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Competitive_CharacterDraft_Drafted )
	self.id = "Competitive_CharacterDraft_Drafted"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 135 )
	self:setTopBottom( 0, 0, 0, 135 )
	
	local Warning0 = LUI.UIImage.new()
	Warning0:setLeftRight( 0.5, 0.5, -30, 30 )
	Warning0:setTopBottom( 0.5, 0.5, -50, 0 )
	Warning0:setRGB( 0, 0, 0 )
	Warning0:setAlpha( 0 )
	Warning0:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
	self:addElement( Warning0 )
	self.Warning0 = Warning0
	
	local Warning = LUI.UIImage.new()
	Warning:setLeftRight( 0.5, 0.5, -30, 30 )
	Warning:setTopBottom( 0.5, 0.5, -50, 0 )
	Warning:setAlpha( 0 )
	Warning:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
	self:addElement( Warning )
	self.Warning = Warning
	
	local PregameDraftedContainer = CoD.Pregame_DraftedContainer.new( menu, controller )
	PregameDraftedContainer:setLeftRight( 0.5, 0.5, -62.5, 62.5 )
	PregameDraftedContainer:setTopBottom( 0.5, 0.5, 0.5, 39.5 )
	PregameDraftedContainer:setAlpha( 0 )
	PregameDraftedContainer.Text:setText( Engine.Localize( "MENU_DRAFTED_CAPS" ) )
	self:addElement( PregameDraftedContainer )
	self.PregameDraftedContainer = PregameDraftedContainer
	
	self.resetProperties = function ()
		PregameDraftedContainer:completeAnimation()
		Warning0:completeAnimation()
		Warning:completeAnimation()
		PregameDraftedContainer:setLeftRight( 0.5, 0.5, -62.5, 62.5 )
		PregameDraftedContainer:setTopBottom( 0.5, 0.5, 0.5, 39.5 )
		PregameDraftedContainer:setAlpha( 0 )
		PregameDraftedContainer.Text:setText( Engine.Localize( "MENU_DRAFTED_CAPS" ) )
		Warning0:setLeftRight( 0.5, 0.5, -30, 30 )
		Warning0:setTopBottom( 0.5, 0.5, -50, 0 )
		Warning0:setAlpha( 0 )
		Warning:setLeftRight( 0.5, 0.5, -30, 30 )
		Warning:setTopBottom( 0.5, 0.5, -50, 0 )
		Warning:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PregameDraftedContainer:completeAnimation()
				self.PregameDraftedContainer:setLeftRight( 0.5, 0.5, -63, 62 )
				self.PregameDraftedContainer:setTopBottom( 0.5, 0.5, 0.5, 39.5 )
				self.clipFinished( PregameDraftedContainer, {} )
			end
		},
		Drafted = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Warning0:completeAnimation()
				self.Warning0:setLeftRight( 0.5, 0.5, -30, 30 )
				self.Warning0:setTopBottom( 0.5, 0.5, -62, -12 )
				self.clipFinished( Warning0, {} )
				Warning:completeAnimation()
				self.Warning:setLeftRight( 0.5, 0.5, -30, 30 )
				self.Warning:setTopBottom( 0.5, 0.5, -62, -12 )
				self.clipFinished( Warning, {} )
				PregameDraftedContainer:completeAnimation()
				self.PregameDraftedContainer:setLeftRight( 0.5, 0.5, -63, 62 )
				self.PregameDraftedContainer:setTopBottom( 0.5, 0.5, -18, 18 )
				self.PregameDraftedContainer:setAlpha( 1 )
				self.clipFinished( PregameDraftedContainer, {} )
			end
		},
		Banned = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Warning0:completeAnimation()
				self.Warning0:setLeftRight( 0.5, 0.5, -30, 30 )
				self.Warning0:setTopBottom( 0.5, 0.5, -53, -3 )
				self.Warning0:setAlpha( 1 )
				self.clipFinished( Warning0, {} )
				Warning:completeAnimation()
				self.Warning:setLeftRight( 0.5, 0.5, -30, 30 )
				self.Warning:setTopBottom( 0.5, 0.5, -53, -3 )
				self.Warning:setAlpha( 1 )
				self.clipFinished( Warning, {} )
				PregameDraftedContainer:completeAnimation()
				PregameDraftedContainer.Text:completeAnimation()
				self.PregameDraftedContainer:setLeftRight( 0.5, 0.5, -52.5, 51.5 )
				self.PregameDraftedContainer:setTopBottom( 0.5, 0.5, -3, 33 )
				self.PregameDraftedContainer:setAlpha( 1 )
				self.PregameDraftedContainer.Text:setText( Engine.Localize( "MENU_BANNED_CAPS" ) )
				self.clipFinished( PregameDraftedContainer, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Drafted",
			condition = function ( menu, element, event )
				return CharacterLoadoutDrafted( menu, element, controller )
			end
		},
		{
			stateName = "Banned",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PregameDraftedContainer:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

