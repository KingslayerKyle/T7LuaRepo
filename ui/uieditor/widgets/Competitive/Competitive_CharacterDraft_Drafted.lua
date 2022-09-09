-- b0d1de84d24e5df146245bcee10356e3
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 90 )
	
	local Warning0 = LUI.UIImage.new()
	Warning0:setLeftRight( false, false, -20, 20 )
	Warning0:setTopBottom( false, false, -33, 0 )
	Warning0:setRGB( 0, 0, 0 )
	Warning0:setAlpha( 0 )
	Warning0:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
	self:addElement( Warning0 )
	self.Warning0 = Warning0
	
	local Warning = LUI.UIImage.new()
	Warning:setLeftRight( false, false, -20, 20 )
	Warning:setTopBottom( false, false, -33, 0 )
	Warning:setAlpha( 0 )
	Warning:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
	self:addElement( Warning )
	self.Warning = Warning
	
	local PregameDraftedContainer = CoD.Pregame_DraftedContainer.new( menu, controller )
	PregameDraftedContainer:setLeftRight( false, false, -41.75, 41.75 )
	PregameDraftedContainer:setTopBottom( false, false, 0, 26 )
	PregameDraftedContainer:setAlpha( 0 )
	PregameDraftedContainer.Text:setText( Engine.Localize( "MENU_DRAFTED_CAPS" ) )
	self:addElement( PregameDraftedContainer )
	self.PregameDraftedContainer = PregameDraftedContainer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Warning0:completeAnimation()
				self.Warning0:setLeftRight( false, false, -20, 20 )
				self.Warning0:setTopBottom( false, false, -33, 0 )
				self.Warning0:setAlpha( 0 )
				self.clipFinished( Warning0, {} )

				Warning:completeAnimation()
				self.Warning:setLeftRight( false, false, -20, 20 )
				self.Warning:setTopBottom( false, false, -33, 0 )
				self.Warning:setAlpha( 0 )
				self.clipFinished( Warning, {} )

				PregameDraftedContainer:completeAnimation()
				self.PregameDraftedContainer:setLeftRight( false, false, -41.75, 41.75 )
				self.PregameDraftedContainer:setTopBottom( false, false, 0, 26 )
				self.PregameDraftedContainer:setAlpha( 0 )
				self.clipFinished( PregameDraftedContainer, {} )
			end
		},
		Drafted = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Warning0:completeAnimation()
				self.Warning0:setLeftRight( false, false, -20, 20 )
				self.Warning0:setTopBottom( false, false, -41, -8 )
				self.Warning0:setAlpha( 0 )
				self.clipFinished( Warning0, {} )

				Warning:completeAnimation()
				self.Warning:setLeftRight( false, false, -20, 20 )
				self.Warning:setTopBottom( false, false, -41, -8 )
				self.Warning:setAlpha( 0 )
				self.clipFinished( Warning, {} )

				PregameDraftedContainer:completeAnimation()
				self.PregameDraftedContainer:setLeftRight( false, false, -41.75, 41.75 )
				self.PregameDraftedContainer:setTopBottom( false, false, -12, 12 )
				self.PregameDraftedContainer:setAlpha( 1 )
				self.clipFinished( PregameDraftedContainer, {} )
			end
		},
		Banned = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Warning0:completeAnimation()
				self.Warning0:setLeftRight( false, false, -20, 20 )
				self.Warning0:setTopBottom( false, false, -35, -2 )
				self.Warning0:setAlpha( 1 )
				self.clipFinished( Warning0, {} )

				Warning:completeAnimation()
				self.Warning:setLeftRight( false, false, -20, 20 )
				self.Warning:setTopBottom( false, false, -35, -2 )
				self.Warning:setAlpha( 1 )
				self.clipFinished( Warning, {} )

				PregameDraftedContainer:completeAnimation()

				PregameDraftedContainer.Text:completeAnimation()
				self.PregameDraftedContainer:setLeftRight( false, false, -34.75, 34.75 )
				self.PregameDraftedContainer:setTopBottom( false, false, -2, 22 )
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
				return ItemIsBannedLobby( menu, element, controller )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PregameDraftedContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
