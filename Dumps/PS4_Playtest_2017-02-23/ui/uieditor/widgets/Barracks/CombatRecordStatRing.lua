CoD.CombatRecordStatRing = InheritFrom( LUI.UIElement )
CoD.CombatRecordStatRing.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordStatRing )
	self.id = "CombatRecordStatRing"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 384 )
	self:setTopBottom( 0, 0, 0, 384 )
	
	local BGRing = LUI.UIImage.new()
	BGRing:setLeftRight( 1, 1, -384, 0 )
	BGRing:setTopBottom( 0, 0, 0, 384 )
	BGRing:setRGB( 0.36, 0.36, 0.36 )
	BGRing:setAlpha( 0.35 )
	BGRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringfore" ) )
	self:addElement( BGRing )
	self.BGRing = BGRing
	
	local WinsRing = LUI.UIImage.new()
	WinsRing:setLeftRight( 1, 1, -384, 0 )
	WinsRing:setTopBottom( 0, 0, 0, 384 )
	WinsRing:setRGB( 0.95, 0.91, 0.11 )
	WinsRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringthin" ) )
	self:addElement( WinsRing )
	self.WinsRing = WinsRing
	
	local WLRatioLabel = LUI.UIText.new()
	WLRatioLabel:setLeftRight( 1, 1, -354, -30 )
	WLRatioLabel:setTopBottom( 0, 0, 141, 192 )
	WLRatioLabel:setText( Engine.Localize( "MENU_WLRATIO_CAPS" ) )
	WLRatioLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WLRatioLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WLRatioLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WLRatioLabel )
	self.WLRatioLabel = WLRatioLabel
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( 1, 1, -354, -30 )
	StatValue:setTopBottom( 0, 0, 192, 252 )
	StatValue:setRGB( 1, 0.8, 0.4 )
	StatValue:setText( Engine.Localize( "42,000" ) )
	StatValue:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatValue )
	self.StatValue = StatValue
	
	local LossRing = LUI.UIImage.new()
	LossRing:setLeftRight( 1, 1, -384, 0 )
	LossRing:setTopBottom( 0, 0, 0, 384 )
	LossRing:setRGB( 0.38, 0.38, 0.38 )
	LossRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringthinloss" ) )
	LossRing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	LossRing:setShaderVector( 0, 0.37, 0, 0, 0 )
	LossRing:setShaderVector( 1, 0.5, 0, 0, 0 )
	LossRing:setShaderVector( 2, 0.5, 0, 0, 0 )
	LossRing:setShaderVector( 3, 0, 0, 0, 0 )
	LossRing:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( LossRing )
	self.LossRing = LossRing
	
	local ComparisonStatValue = LUI.UIText.new()
	ComparisonStatValue:setLeftRight( 1, 1, -354, -30 )
	ComparisonStatValue:setTopBottom( 0, 0, 252, 312 )
	ComparisonStatValue:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	ComparisonStatValue:setText( Engine.Localize( "42,000" ) )
	ComparisonStatValue:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ComparisonStatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ComparisonStatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ComparisonStatValue )
	self.ComparisonStatValue = ComparisonStatValue
	
	self.resetProperties = function ()
		ComparisonStatValue:completeAnimation()
		ComparisonStatValue:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ComparisonStatValue:completeAnimation()
				self.ComparisonStatValue:setAlpha( 0 )
				self.clipFinished( ComparisonStatValue, {} )
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
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

