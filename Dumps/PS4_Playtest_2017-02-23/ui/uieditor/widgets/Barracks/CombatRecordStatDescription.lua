CoD.CombatRecordStatDescription = InheritFrom( LUI.UIElement )
CoD.CombatRecordStatDescription.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordStatDescription )
	self.id = "CombatRecordStatDescription"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 574 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local StatDescription = LUI.UIText.new()
	StatDescription:setLeftRight( 0, 1, 0, 0 )
	StatDescription:setTopBottom( 0, 1, 0, 0 )
	StatDescription:setText( Engine.Localize( "MENU_NEW" ) )
	StatDescription:setTTF( "fonts/default.ttf" )
	StatDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	StatDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatDescription )
	self.StatDescription = StatDescription
	
	self.resetProperties = function ()
		StatDescription:completeAnimation()
		StatDescription:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Comparing = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				StatDescription:completeAnimation()
				self.StatDescription:setAlpha( 0 )
				self.clipFinished( StatDescription, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Comparing",
			condition = function ( menu, element, event )
				return IsComparingStats( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordComparing" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordComparing"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

