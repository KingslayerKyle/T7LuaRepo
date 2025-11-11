require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameAndCount" )

CoD.BribeDuplicatesPopupInfo = InheritFrom( LUI.UIElement )
CoD.BribeDuplicatesPopupInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BribeDuplicatesPopupInfo )
	self.id = "BribeDuplicatesPopupInfo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 331 )
	self:setTopBottom( 0, 0, 0, 373 )
	self.anyChildUsesUpdateState = true
	
	local DuplicateBoxOutline = LUI.UIImage.new()
	DuplicateBoxOutline:setLeftRight( 0, 0, 198, 302 )
	DuplicateBoxOutline:setTopBottom( 0, 0, 32, 144 )
	DuplicateBoxOutline:setAlpha( 0.3 )
	DuplicateBoxOutline:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	DuplicateBoxOutline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	DuplicateBoxOutline:setShaderVector( 0, 0, 0, 0, 0 )
	DuplicateBoxOutline:setupNineSliceShader( 6, 6 )
	self:addElement( DuplicateBoxOutline )
	self.DuplicateBoxOutline = DuplicateBoxOutline
	
	local totalDupeCount = LUI.UIText.new()
	totalDupeCount:setLeftRight( 0, 0, 31, 184 )
	totalDupeCount:setTopBottom( 0, 0, 50, 98 )
	totalDupeCount:setTTF( "fonts/default.ttf" )
	totalDupeCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	totalDupeCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	totalDupeCount:linkToElementModel( self, "totalDuplicates", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			totalDupeCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( totalDupeCount )
	self.totalDupeCount = totalDupeCount
	
	local totalDupeText = LUI.UIText.new()
	totalDupeText:setLeftRight( 0, 0, 33, 186 )
	totalDupeText:setTopBottom( 0, 0, 93, 131 )
	totalDupeText:setText( Engine.Localize( "MPUI_BM_DUPLICATES" ) )
	totalDupeText:setTTF( "fonts/default.ttf" )
	totalDupeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	totalDupeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( totalDupeText )
	self.totalDupeText = totalDupeText
	
	local CommonDupeCount = CoD.CryptokeyTypeNameAndCount.new( menu, controller )
	CommonDupeCount:mergeStateConditions( {
		{
			stateName = "Common",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	CommonDupeCount:linkToElementModel( CommonDupeCount, "cryptoKeyType", true, function ( model )
		menu:updateElementState( CommonDupeCount, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "cryptoKeyType"
		} )
	end )
	CommonDupeCount:setLeftRight( 0, 0, 30, 300 )
	CommonDupeCount:setTopBottom( 0, 0, 167, 207 )
	CommonDupeCount.nameText:setText( LocalizeToUpperString( "MPUI_BM_COMMON" ) )
	CommonDupeCount:linkToElementModel( self, "commonDuplicates", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CommonDupeCount.count:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CommonDupeCount )
	self.CommonDupeCount = CommonDupeCount
	
	local CryptokeyTypeNameAndCount0 = CoD.CryptokeyTypeNameAndCount.new( menu, controller )
	CryptokeyTypeNameAndCount0:mergeStateConditions( {
		{
			stateName = "Common",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Rare",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	CryptokeyTypeNameAndCount0:linkToElementModel( CryptokeyTypeNameAndCount0, "cryptoKeyType", true, function ( model )
		menu:updateElementState( CryptokeyTypeNameAndCount0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "cryptoKeyType"
		} )
	end )
	CryptokeyTypeNameAndCount0:setLeftRight( 0, 0, 30, 300 )
	CryptokeyTypeNameAndCount0:setTopBottom( 0, 0, 216, 256 )
	CryptokeyTypeNameAndCount0.nameText:setText( LocalizeToUpperString( "MPUI_BM_RARE" ) )
	CryptokeyTypeNameAndCount0:linkToElementModel( self, "rareDuplicates", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CryptokeyTypeNameAndCount0.count:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CryptokeyTypeNameAndCount0 )
	self.CryptokeyTypeNameAndCount0 = CryptokeyTypeNameAndCount0
	
	local CryptokeyTypeNameAndCount1 = CoD.CryptokeyTypeNameAndCount.new( menu, controller )
	CryptokeyTypeNameAndCount1:mergeStateConditions( {
		{
			stateName = "Common",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Rare",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Legendary",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	CryptokeyTypeNameAndCount1:linkToElementModel( CryptokeyTypeNameAndCount1, "cryptoKeyType", true, function ( model )
		menu:updateElementState( CryptokeyTypeNameAndCount1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "cryptoKeyType"
		} )
	end )
	CryptokeyTypeNameAndCount1:setLeftRight( 0, 0, 30, 300 )
	CryptokeyTypeNameAndCount1:setTopBottom( 0, 0, 266, 306 )
	CryptokeyTypeNameAndCount1.nameText:setText( LocalizeToUpperString( "MPUI_BM_LEGENDARY" ) )
	CryptokeyTypeNameAndCount1:linkToElementModel( self, "legendaryDuplicates", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CryptokeyTypeNameAndCount1.count:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CryptokeyTypeNameAndCount1 )
	self.CryptokeyTypeNameAndCount1 = CryptokeyTypeNameAndCount1
	
	local CryptokeyTypeNameAndCount2 = CoD.CryptokeyTypeNameAndCount.new( menu, controller )
	CryptokeyTypeNameAndCount2:mergeStateConditions( {
		{
			stateName = "Common",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Rare",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Legendary",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Epic",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	CryptokeyTypeNameAndCount2:setLeftRight( 0, 0, 30, 300 )
	CryptokeyTypeNameAndCount2:setTopBottom( 0, 0, 315, 355 )
	CryptokeyTypeNameAndCount2.nameText:setText( LocalizeToUpperString( "MPUI_BM_EPIC" ) )
	CryptokeyTypeNameAndCount2:linkToElementModel( self, "epicDuplicates", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CryptokeyTypeNameAndCount2.count:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CryptokeyTypeNameAndCount2 )
	self.CryptokeyTypeNameAndCount2 = CryptokeyTypeNameAndCount2
	
	local DuplicateBoxOutline0 = LUI.UIImage.new()
	DuplicateBoxOutline0:setLeftRight( 0, 0, 27, 192 )
	DuplicateBoxOutline0:setTopBottom( 0, 0, 32, 144 )
	DuplicateBoxOutline0:setAlpha( 0.3 )
	DuplicateBoxOutline0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	DuplicateBoxOutline0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	DuplicateBoxOutline0:setShaderVector( 0, 0, 0, 0, 0 )
	DuplicateBoxOutline0:setupNineSliceShader( 6, 6 )
	self:addElement( DuplicateBoxOutline0 )
	self.DuplicateBoxOutline0 = DuplicateBoxOutline0
	
	local CryptoKeyIcon = LUI.UIImage.new()
	CryptoKeyIcon:setLeftRight( 0, 0, 206, 293 )
	CryptoKeyIcon:setTopBottom( 0, 0, 48, 135 )
	CryptoKeyIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoKeyIcon )
	self.CryptoKeyIcon = CryptoKeyIcon
	
	self.resetProperties = function ()
		CryptokeyTypeNameAndCount2:completeAnimation()
		CryptokeyTypeNameAndCount1:completeAnimation()
		CryptokeyTypeNameAndCount0:completeAnimation()
		CommonDupeCount:completeAnimation()
		CryptokeyTypeNameAndCount2:setAlpha( 1 )
		CryptokeyTypeNameAndCount1:setAlpha( 1 )
		CryptokeyTypeNameAndCount0:setAlpha( 1 )
		CommonDupeCount:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoDuplicates = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				CommonDupeCount:completeAnimation()
				self.CommonDupeCount:setAlpha( 0 )
				self.clipFinished( CommonDupeCount, {} )
				CryptokeyTypeNameAndCount0:completeAnimation()
				self.CryptokeyTypeNameAndCount0:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameAndCount0, {} )
				CryptokeyTypeNameAndCount1:completeAnimation()
				self.CryptokeyTypeNameAndCount1:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameAndCount1, {} )
				CryptokeyTypeNameAndCount2:completeAnimation()
				self.CryptokeyTypeNameAndCount2:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameAndCount2, {} )
			end
		},
		HasEpic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		HasLegendary = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CryptokeyTypeNameAndCount2:completeAnimation()
				self.CryptokeyTypeNameAndCount2:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameAndCount2, {} )
			end
		},
		HasRare = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				CryptokeyTypeNameAndCount1:completeAnimation()
				self.CryptokeyTypeNameAndCount1:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameAndCount1, {} )
				CryptokeyTypeNameAndCount2:completeAnimation()
				self.CryptokeyTypeNameAndCount2:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameAndCount2, {} )
			end
		},
		OnlyCommon = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				CryptokeyTypeNameAndCount0:completeAnimation()
				self.CryptokeyTypeNameAndCount0:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameAndCount0, {} )
				CryptokeyTypeNameAndCount1:completeAnimation()
				self.CryptokeyTypeNameAndCount1:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameAndCount1, {} )
				CryptokeyTypeNameAndCount2:completeAnimation()
				self.CryptokeyTypeNameAndCount2:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameAndCount2, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoDuplicates",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "totalDuplicates", 0 )
			end
		},
		{
			stateName = "HasEpic",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "epicDuplicates", 0 )
			end
		},
		{
			stateName = "HasLegendary",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "legendaryDuplicates", 0 )
			end
		},
		{
			stateName = "HasRare",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "rareDuplicates", 0 )
			end
		},
		{
			stateName = "OnlyCommon",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "commonDuplicates", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "totalDuplicates", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "totalDuplicates"
		} )
	end )
	self:linkToElementModel( self, "epicDuplicates", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "epicDuplicates"
		} )
	end )
	self:linkToElementModel( self, "legendaryDuplicates", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "legendaryDuplicates"
		} )
	end )
	self:linkToElementModel( self, "rareDuplicates", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rareDuplicates"
		} )
	end )
	self:linkToElementModel( self, "commonDuplicates", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "commonDuplicates"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CommonDupeCount:close()
		self.CryptokeyTypeNameAndCount0:close()
		self.CryptokeyTypeNameAndCount1:close()
		self.CryptokeyTypeNameAndCount2:close()
		self.totalDupeCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

