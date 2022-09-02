-- f44974954b5eda7ecf5c98b4119137bb
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 60 )
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( false, true, -96, 0 )
	emblem:setTopBottom( false, false, -30, 30 )
	emblem:subscribeToGlobalModel( controller, "OtherPlayerStats", "XUID", function ( model )
		local XUID = Engine.GetModelValue( model )
		if XUID then
			emblem:setupPlayerEmblemByXUID( XUID )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local ComparingLabel = LUI.UIText.new()
	ComparingLabel:setLeftRight( true, true, -17, -100.5 )
	ComparingLabel:setTopBottom( false, false, -25, 0 )
	ComparingLabel:setText( Engine.Localize( "MENU_COMPARING_CAPS" ) )
	ComparingLabel:setTTF( "fonts/default.ttf" )
	ComparingLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	ComparingLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ComparingLabel )
	self.ComparingLabel = ComparingLabel
	
	local ComparingGamertag = LUI.UIText.new()
	ComparingGamertag:setLeftRight( true, true, -17, -100.5 )
	ComparingGamertag:setTopBottom( false, false, 0, 25 )
	ComparingGamertag:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	ComparingGamertag:setTTF( "fonts/default.ttf" )
	ComparingGamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	ComparingGamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ComparingGamertag:subscribeToGlobalModel( controller, "OtherPlayerStats", "gamertag", function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			ComparingGamertag:setText( gamertag )
		end
	end )
	self:addElement( ComparingGamertag )
	self.ComparingGamertag = ComparingGamertag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 3 )

				emblem:completeAnimation()
				self.emblem:setAlpha( 1 )
				self.clipFinished( emblem, {} )

				ComparingLabel:completeAnimation()
				self.ComparingLabel:setAlpha( 1 )
				self.clipFinished( ComparingLabel, {} )

				ComparingGamertag:completeAnimation()
				self.ComparingGamertag:setAlpha( 1 )
				self.clipFinished( ComparingGamertag, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.emblem:close()
		element.ComparingGamertag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

