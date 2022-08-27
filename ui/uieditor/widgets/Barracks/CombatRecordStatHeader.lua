-- 9b40788cff1469824a259c761961354b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderThin" )

CoD.CombatRecordStatHeader = InheritFrom( LUI.UIElement )
CoD.CombatRecordStatHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordStatHeader )
	self.id = "CombatRecordStatHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 124 )
	self:setTopBottom( true, false, 0, 56 )
	self.anyChildUsesUpdateState = true
	
	local BlackBar = LUI.UIImage.new()
	BlackBar:setLeftRight( true, true, 1, -1 )
	BlackBar:setTopBottom( false, false, -24.5, -3 )
	BlackBar:setRGB( 0, 0, 0 )
	BlackBar:setAlpha( 0.3 )
	BlackBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BlackBar:setShaderVector( 0, 0.01, 0.05, 0.01, 0.05 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( true, true, 0, 0 )
	StatLabel:setTopBottom( false, false, -24, -4 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( false, false, -47.5, 47.5 )
	StatValue:setTopBottom( false, false, 0, 26 )
	StatValue:setRGB( 1, 0.8, 0.4 )
	StatValue:setText( Engine.Localize( "42,000" ) )
	StatValue:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatValue )
	self.StatValue = StatValue
	
	local ComparedStatValue = LUI.UIText.new()
	ComparedStatValue:setLeftRight( false, false, -47.5, 47.5 )
	ComparedStatValue:setTopBottom( false, false, 34, 60 )
	ComparedStatValue:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	ComparedStatValue:setText( Engine.Localize( "42,000" ) )
	ComparedStatValue:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ComparedStatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ComparedStatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ComparedStatValue )
	self.ComparedStatValue = ComparedStatValue
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( true, true, 0, 0 )
	BorderThin0:setTopBottom( true, true, 0, 0 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	local BorderThin00 = CoD.BorderThin.new( menu, controller )
	BorderThin00:setLeftRight( true, true, 0, 0 )
	BorderThin00:setTopBottom( true, true, 60, 32 )
	self:addElement( BorderThin00 )
	self.BorderThin00 = BorderThin00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ComparedStatValue:completeAnimation()
				self.ComparedStatValue:setAlpha( 0 )
				self.clipFinished( ComparedStatValue, {} )
				BorderThin00:completeAnimation()
				self.BorderThin00:setAlpha( 0 )
				self.clipFinished( BorderThin00, {} )
			end
		},
		Comparing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ComparedStatValue:completeAnimation()
				self.ComparedStatValue:setAlpha( 1 )
				self.clipFinished( ComparedStatValue, {} )
				BorderThin00:completeAnimation()
				self.BorderThin00:setAlpha( 1 )
				self.clipFinished( BorderThin00, {} )
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
		element.BorderThin0:close()
		element.BorderThin00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

