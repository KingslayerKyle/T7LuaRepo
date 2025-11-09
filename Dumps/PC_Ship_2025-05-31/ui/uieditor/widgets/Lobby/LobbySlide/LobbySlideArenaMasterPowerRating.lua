CoD.LobbySlideArenaMasterPowerRating = InheritFrom( LUI.UIElement )
CoD.LobbySlideArenaMasterPowerRating.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideArenaMasterPowerRating )
	self.id = "LobbySlideArenaMasterPowerRating"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 185 )
	self:setTopBottom( true, false, 0, 24 )
	
	local MasterShieldIcon = LUI.UIImage.new()
	MasterShieldIcon:setLeftRight( true, false, 0, 24 )
	MasterShieldIcon:setTopBottom( true, false, 0, 24 )
	MasterShieldIcon:setImage( RegisterImage( "uie_t7_arena_powerrating_shield" ) )
	self:addElement( MasterShieldIcon )
	self.MasterShieldIcon = MasterShieldIcon
	
	local MasterPowerRating = LUI.UIText.new()
	MasterPowerRating:setLeftRight( true, true, 28, 0 )
	MasterPowerRating:setTopBottom( true, false, 3, 21 )
	MasterPowerRating:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	MasterPowerRating:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MasterPowerRating:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	MasterPowerRating:linkToElementModel( self, "arenaSkill", true, function ( model )
		local arenaSkill = Engine.GetModelValue( model )
		if arenaSkill then
			MasterPowerRating:setText( Engine.Localize( GetArenaPowerRating( arenaSkill ) ) )
		end
	end )
	self:addElement( MasterPowerRating )
	self.MasterPowerRating = MasterPowerRating
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				MasterShieldIcon:completeAnimation()
				self.MasterShieldIcon:setAlpha( 0 )
				self.clipFinished( MasterShieldIcon, {} )
				MasterPowerRating:completeAnimation()
				self.MasterPowerRating:setAlpha( 0 )
				self.clipFinished( MasterPowerRating, {} )
			end
		},
		IsMaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				MasterShieldIcon:completeAnimation()
				self.MasterShieldIcon:setAlpha( 1 )
				self.clipFinished( MasterShieldIcon, {} )
				MasterPowerRating:completeAnimation()
				self.MasterPowerRating:setAlpha( 1 )
				self.clipFinished( MasterPowerRating, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IsMaster",
			condition = function ( menu, element, event )
				return SelectedPlayerIsArenaMaster( element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "Arena.selectedPlayerPoints" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Arena.selectedPlayerPoints"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "Arena.selectedPlayerSkill" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Arena.selectedPlayerSkill"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MasterPowerRating:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

