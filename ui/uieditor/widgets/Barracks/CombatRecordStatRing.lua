-- a2651c20391f01161b3d2db6cf4ff228
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 256 )
	
	local BGRing = LUI.UIImage.new()
	BGRing:setLeftRight( false, true, -256, 0 )
	BGRing:setTopBottom( true, false, 0, 256 )
	BGRing:setRGB( 0.36, 0.36, 0.36 )
	BGRing:setAlpha( 0.35 )
	BGRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringfore" ) )
	self:addElement( BGRing )
	self.BGRing = BGRing
	
	local WinsRing = LUI.UIImage.new()
	WinsRing:setLeftRight( false, true, -256, 0 )
	WinsRing:setTopBottom( true, false, 0, 256 )
	WinsRing:setRGB( 0.95, 0.91, 0.11 )
	WinsRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringthin" ) )
	self:addElement( WinsRing )
	self.WinsRing = WinsRing
	
	local WLRatioLabel = LUI.UIText.new()
	WLRatioLabel:setLeftRight( false, true, -236, -20 )
	WLRatioLabel:setTopBottom( true, false, 94, 128 )
	WLRatioLabel:setText( Engine.Localize( "MENU_WLRATIO_CAPS" ) )
	WLRatioLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WLRatioLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WLRatioLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WLRatioLabel )
	self.WLRatioLabel = WLRatioLabel
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( false, true, -236, -20 )
	StatValue:setTopBottom( true, false, 128, 168 )
	StatValue:setRGB( 1, 0.8, 0.4 )
	StatValue:setText( Engine.Localize( "42,000" ) )
	StatValue:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatValue )
	self.StatValue = StatValue
	
	local LossRing = LUI.UIImage.new()
	LossRing:setLeftRight( false, true, -256, 0 )
	LossRing:setTopBottom( true, false, 0, 256 )
	LossRing:setRGB( 0.38, 0.38, 0.38 )
	LossRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringthinloss" ) )
	LossRing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	LossRing:setShaderVector( 0, 0.37, 0, 0, 0 )
	LossRing:setShaderVector( 1, 0.5, 0, 0, 0 )
	LossRing:setShaderVector( 2, 0.5, 0, 0, 0 )
	LossRing:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( LossRing )
	self.LossRing = LossRing
	
	local ComparisonStatValue = LUI.UIText.new()
	ComparisonStatValue:setLeftRight( false, true, -236, -20 )
	ComparisonStatValue:setTopBottom( true, false, 168, 208 )
	ComparisonStatValue:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	ComparisonStatValue:setText( Engine.Localize( "42,000" ) )
	ComparisonStatValue:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ComparisonStatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ComparisonStatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ComparisonStatValue )
	self.ComparisonStatValue = ComparisonStatValue
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ComparisonStatValue:completeAnimation()
				self.ComparisonStatValue:setAlpha( 0 )
				self.clipFinished( ComparisonStatValue, {} )
			end
		},
		Comparing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ComparisonStatValue:completeAnimation()
				self.ComparisonStatValue:setAlpha( 1 )
				self.clipFinished( ComparisonStatValue, {} )
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

