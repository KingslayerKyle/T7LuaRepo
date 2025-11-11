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
	self:setLeftRight( 0, 0, 0, 277 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local MasterShieldIcon = LUI.UIImage.new()
	MasterShieldIcon:setLeftRight( 0, 0, 0, 36 )
	MasterShieldIcon:setTopBottom( 0, 0, 0, 36 )
	MasterShieldIcon:setImage( RegisterImage( "uie_t7_arena_powerrating_shield" ) )
	self:addElement( MasterShieldIcon )
	self.MasterShieldIcon = MasterShieldIcon
	
	local MasterPowerRating = LUI.UIText.new()
	MasterPowerRating:setLeftRight( 0, 1, 42, 0 )
	MasterPowerRating:setTopBottom( 0, 0, 4, 31 )
	MasterPowerRating:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	MasterPowerRating:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MasterPowerRating:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	MasterPowerRating:linkToElementModel( self, "arenaSkill", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MasterPowerRating:setText( GetArenaPowerRating( modelValue ) )
		end
	end )
	self:addElement( MasterPowerRating )
	self.MasterPowerRating = MasterPowerRating
	
	self.resetProperties = function ()
		MasterPowerRating:completeAnimation()
		MasterShieldIcon:completeAnimation()
		MasterPowerRating:setAlpha( 1 )
		MasterShieldIcon:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MasterPowerRating:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

