CoD.CombatRecordComparingPlayerInfo = InheritFrom( LUI.UIElement )
CoD.CombatRecordComparingPlayerInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordComparingPlayerInfo )
	self.id = "CombatRecordComparingPlayerInfo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 450 )
	self:setTopBottom( 0, 0, 0, 90 )
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( 1, 1, -144, 0 )
	emblem:setTopBottom( 0.5, 0.5, -45, 45 )
	emblem:subscribeToGlobalModel( controller, "OtherPlayerStats", "XUID", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local ComparingLabel = LUI.UIText.new()
	ComparingLabel:setLeftRight( 0, 1, -25, -151 )
	ComparingLabel:setTopBottom( 0.5, 0.5, -38, 0 )
	ComparingLabel:setText( Engine.Localize( "MENU_COMPARING_CAPS" ) )
	ComparingLabel:setTTF( "fonts/default.ttf" )
	ComparingLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	ComparingLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ComparingLabel )
	self.ComparingLabel = ComparingLabel
	
	local ComparingGamertag = LUI.UIText.new()
	ComparingGamertag:setLeftRight( 0, 1, -25, -151 )
	ComparingGamertag:setTopBottom( 0.5, 0.5, 0, 38 )
	ComparingGamertag:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	ComparingGamertag:setTTF( "fonts/default.ttf" )
	ComparingGamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	ComparingGamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ComparingGamertag:subscribeToGlobalModel( controller, "OtherPlayerStats", "gamertag", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ComparingGamertag:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ComparingGamertag )
	self.ComparingGamertag = ComparingGamertag
	
	self.resetProperties = function ()
		ComparingLabel:completeAnimation()
		ComparingGamertag:completeAnimation()
		emblem:completeAnimation()
		ComparingLabel:setAlpha( 1 )
		ComparingGamertag:setAlpha( 1 )
		emblem:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				emblem:completeAnimation()
				self.emblem:setAlpha( 0 )
				self.clipFinished( emblem, {} )
				ComparingLabel:completeAnimation()
				self.ComparingLabel:setAlpha( 0 )
				self.clipFinished( ComparingLabel, {} )
				ComparingGamertag:completeAnimation()
				self.ComparingGamertag:setAlpha( 0 )
				self.clipFinished( ComparingGamertag, {} )
			end
		},
		Comparing = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.emblem:close()
		self.ComparingGamertag:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

