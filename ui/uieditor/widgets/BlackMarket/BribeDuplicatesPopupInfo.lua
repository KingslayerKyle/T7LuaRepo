-- d2667b1d3f0151f4766163e8abe3be88
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 221 )
	self:setTopBottom( true, false, 0, 249 )
	self.anyChildUsesUpdateState = true
	
	local DuplicateBoxOutline = LUI.UIImage.new()
	DuplicateBoxOutline:setLeftRight( true, false, 132, 201 )
	DuplicateBoxOutline:setTopBottom( true, false, 21, 96 )
	DuplicateBoxOutline:setAlpha( 0.3 )
	DuplicateBoxOutline:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	DuplicateBoxOutline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	DuplicateBoxOutline:setShaderVector( 0, 0.06, 0.05, 0, 0 )
	DuplicateBoxOutline:setupNineSliceShader( 4, 4 )
	self:addElement( DuplicateBoxOutline )
	self.DuplicateBoxOutline = DuplicateBoxOutline
	
	local totalDupeCount = LUI.UIText.new()
	totalDupeCount:setLeftRight( true, false, 21, 123 )
	totalDupeCount:setTopBottom( true, false, 33.5, 65.5 )
	totalDupeCount:setTTF( "fonts/default.ttf" )
	totalDupeCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	totalDupeCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	totalDupeCount:linkToElementModel( self, "totalDuplicates", true, function ( model )
		local totalDuplicates = Engine.GetModelValue( model )
		if totalDuplicates then
			totalDupeCount:setText( Engine.Localize( totalDuplicates ) )
		end
	end )
	self:addElement( totalDupeCount )
	self.totalDupeCount = totalDupeCount
	
	local totalDupeText = LUI.UIText.new()
	totalDupeText:setLeftRight( true, false, 22, 124 )
	totalDupeText:setTopBottom( true, false, 62, 87 )
	totalDupeText:setText( Engine.Localize( "MPUI_BM_DUPLICATES" ) )
	totalDupeText:setTTF( "fonts/default.ttf" )
	totalDupeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	totalDupeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( totalDupeText )
	self.totalDupeText = totalDupeText
	
	local CommonDupeCount = CoD.CryptokeyTypeNameAndCount.new( menu, controller )
	CommonDupeCount:setLeftRight( true, false, 20, 200 )
	CommonDupeCount:setTopBottom( true, false, 111, 138 )
	CommonDupeCount.nameText:setText( Engine.Localize( LocalizeToUpperString( "MPUI_BM_COMMON" ) ) )
	CommonDupeCount:linkToElementModel( self, "commonDuplicates", true, function ( model )
		local commonDuplicates = Engine.GetModelValue( model )
		if commonDuplicates then
			CommonDupeCount.count:setText( Engine.Localize( commonDuplicates ) )
		end
	end )
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
	self:addElement( CommonDupeCount )
	self.CommonDupeCount = CommonDupeCount
	
	local CryptokeyTypeNameAndCount0 = CoD.CryptokeyTypeNameAndCount.new( menu, controller )
	CryptokeyTypeNameAndCount0:setLeftRight( true, false, 20, 200 )
	CryptokeyTypeNameAndCount0:setTopBottom( true, false, 144, 171 )
	CryptokeyTypeNameAndCount0.nameText:setText( Engine.Localize( LocalizeToUpperString( "MPUI_BM_RARE" ) ) )
	CryptokeyTypeNameAndCount0:linkToElementModel( self, "rareDuplicates", true, function ( model )
		local rareDuplicates = Engine.GetModelValue( model )
		if rareDuplicates then
			CryptokeyTypeNameAndCount0.count:setText( Engine.Localize( rareDuplicates ) )
		end
	end )
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
	self:addElement( CryptokeyTypeNameAndCount0 )
	self.CryptokeyTypeNameAndCount0 = CryptokeyTypeNameAndCount0
	
	local CryptokeyTypeNameAndCount1 = CoD.CryptokeyTypeNameAndCount.new( menu, controller )
	CryptokeyTypeNameAndCount1:setLeftRight( true, false, 20, 200 )
	CryptokeyTypeNameAndCount1:setTopBottom( true, false, 177, 204 )
	CryptokeyTypeNameAndCount1.nameText:setText( Engine.Localize( LocalizeToUpperString( "MPUI_BM_LEGENDARY" ) ) )
	CryptokeyTypeNameAndCount1:linkToElementModel( self, "legendaryDuplicates", true, function ( model )
		local legendaryDuplicates = Engine.GetModelValue( model )
		if legendaryDuplicates then
			CryptokeyTypeNameAndCount1.count:setText( Engine.Localize( legendaryDuplicates ) )
		end
	end )
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
	self:addElement( CryptokeyTypeNameAndCount1 )
	self.CryptokeyTypeNameAndCount1 = CryptokeyTypeNameAndCount1
	
	local CryptokeyTypeNameAndCount2 = CoD.CryptokeyTypeNameAndCount.new( menu, controller )
	CryptokeyTypeNameAndCount2:setLeftRight( true, false, 20, 200 )
	CryptokeyTypeNameAndCount2:setTopBottom( true, false, 210, 237 )
	CryptokeyTypeNameAndCount2.nameText:setText( Engine.Localize( LocalizeToUpperString( "MPUI_BM_EPIC" ) ) )
	CryptokeyTypeNameAndCount2:linkToElementModel( self, "epicDuplicates", true, function ( model )
		local epicDuplicates = Engine.GetModelValue( model )
		if epicDuplicates then
			CryptokeyTypeNameAndCount2.count:setText( Engine.Localize( epicDuplicates ) )
		end
	end )
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
	self:addElement( CryptokeyTypeNameAndCount2 )
	self.CryptokeyTypeNameAndCount2 = CryptokeyTypeNameAndCount2
	
	local DuplicateBoxOutline0 = LUI.UIImage.new()
	DuplicateBoxOutline0:setLeftRight( true, false, 18, 128 )
	DuplicateBoxOutline0:setTopBottom( true, false, 21, 96 )
	DuplicateBoxOutline0:setAlpha( 0.3 )
	DuplicateBoxOutline0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	DuplicateBoxOutline0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	DuplicateBoxOutline0:setShaderVector( 0, 0.04, 0.05, 0, 0 )
	DuplicateBoxOutline0:setupNineSliceShader( 4, 4 )
	self:addElement( DuplicateBoxOutline0 )
	self.DuplicateBoxOutline0 = DuplicateBoxOutline0
	
	local CryptoKeyIcon = LUI.UIImage.new()
	CryptoKeyIcon:setLeftRight( true, false, 137, 195 )
	CryptoKeyIcon:setTopBottom( true, false, 32, 90 )
	CryptoKeyIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoKeyIcon )
	self.CryptoKeyIcon = CryptoKeyIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				CommonDupeCount:completeAnimation()
				self.CommonDupeCount:setAlpha( 1 )
				self.clipFinished( CommonDupeCount, {} )
				CryptokeyTypeNameAndCount0:completeAnimation()
				self.CryptokeyTypeNameAndCount0:setAlpha( 1 )
				self.clipFinished( CryptokeyTypeNameAndCount0, {} )
				CryptokeyTypeNameAndCount1:completeAnimation()
				self.CryptokeyTypeNameAndCount1:setAlpha( 1 )
				self.clipFinished( CryptokeyTypeNameAndCount1, {} )
				CryptokeyTypeNameAndCount2:completeAnimation()
				self.CryptokeyTypeNameAndCount2:setAlpha( 1 )
				self.clipFinished( CryptokeyTypeNameAndCount2, {} )
			end
		},
		NoDuplicates = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 4 )
				CommonDupeCount:completeAnimation()
				self.CommonDupeCount:setAlpha( 1 )
				self.clipFinished( CommonDupeCount, {} )
				CryptokeyTypeNameAndCount0:completeAnimation()
				self.CryptokeyTypeNameAndCount0:setAlpha( 1 )
				self.clipFinished( CryptokeyTypeNameAndCount0, {} )
				CryptokeyTypeNameAndCount1:completeAnimation()
				self.CryptokeyTypeNameAndCount1:setAlpha( 1 )
				self.clipFinished( CryptokeyTypeNameAndCount1, {} )
				CryptokeyTypeNameAndCount2:completeAnimation()
				self.CryptokeyTypeNameAndCount2:setAlpha( 1 )
				self.clipFinished( CryptokeyTypeNameAndCount2, {} )
			end
		},
		HasLegendary = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				CommonDupeCount:completeAnimation()
				self.CommonDupeCount:setAlpha( 1 )
				self.clipFinished( CommonDupeCount, {} )
				CryptokeyTypeNameAndCount0:completeAnimation()
				self.CryptokeyTypeNameAndCount0:setAlpha( 1 )
				self.clipFinished( CryptokeyTypeNameAndCount0, {} )
				CryptokeyTypeNameAndCount1:completeAnimation()
				self.CryptokeyTypeNameAndCount1:setAlpha( 1 )
				self.clipFinished( CryptokeyTypeNameAndCount1, {} )
				CryptokeyTypeNameAndCount2:completeAnimation()
				self.CryptokeyTypeNameAndCount2:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameAndCount2, {} )
			end
		},
		HasRare = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				CommonDupeCount:completeAnimation()
				self.CommonDupeCount:setAlpha( 1 )
				self.clipFinished( CommonDupeCount, {} )
				CryptokeyTypeNameAndCount0:completeAnimation()
				self.CryptokeyTypeNameAndCount0:setAlpha( 1 )
				self.clipFinished( CryptokeyTypeNameAndCount0, {} )
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
				self:setupElementClipCounter( 4 )
				CommonDupeCount:completeAnimation()
				self.CommonDupeCount:setAlpha( 1 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CommonDupeCount:close()
		element.CryptokeyTypeNameAndCount0:close()
		element.CryptokeyTypeNameAndCount1:close()
		element.CryptokeyTypeNameAndCount2:close()
		element.totalDupeCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

