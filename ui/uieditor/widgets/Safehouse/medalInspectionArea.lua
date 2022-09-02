-- 52d1274a7832108f1bcfe472cd2b54a7
-- This hash is used for caching, delete to decompile the file again

CoD.medalInspectionArea = InheritFrom( LUI.UIElement )
CoD.medalInspectionArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.medalInspectionArea )
	self.id = "medalInspectionArea"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 546 )
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( false, false, -163.5, 163.5 )
	icon:setTopBottom( true, false, 7, 334 )
	icon:setupUIStreamedImage( 0 )
	icon:linkToElementModel( self, "largeIcon", true, function ( model )
		local largeIcon = Engine.GetModelValue( model )
		if largeIcon then
			icon:setImage( RegisterImage( largeIcon ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( true, false, -31, 404 )
	SecTitleBG:setTopBottom( true, false, 339, 387.22 )
	SecTitleBG:setAlpha( 0.65 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, -27, 1 )
	Image30:setTopBottom( true, false, 337, 341 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( true, false, -27, 1 )
	Image300:setTopBottom( true, false, 382, 386 )
	Image300:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image300:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local line00 = LUI.UIImage.new()
	line00:setLeftRight( true, false, 67, 68 )
	line00:setTopBottom( true, false, 422, 525 )
	line00:setAlpha( 0.27 )
	line00:setZRot( 90 )
	self:addElement( line00 )
	self.line00 = line00
	
	local xpBonus = LUI.UITightText.new()
	xpBonus:setLeftRight( true, false, 18, 218 )
	xpBonus:setTopBottom( true, false, 487, 512 )
	xpBonus:setRGB( 0.95, 0.89, 0.03 )
	xpBonus:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	xpBonus:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	xpBonus:setShaderVector( 0, 0.06, 0, 0, 0 )
	xpBonus:setShaderVector( 1, 0.02, 0, 0, 0 )
	xpBonus:setShaderVector( 2, 1, 0, 0, 0 )
	xpBonus:setLetterSpacing( 1 )
	xpBonus:linkToElementModel( self, "xpBonus", true, function ( model )
		local _xpBonus = Engine.GetModelValue( model )
		if _xpBonus then
			xpBonus:setText( Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", _xpBonus ) ) )
		end
	end )
	self:addElement( xpBonus )
	self.xpBonus = xpBonus
	
	local name = LUI.UITightText.new()
	name:setLeftRight( true, false, 16, 216 )
	name:setTopBottom( true, false, 353, 373 )
	name:setTTF( "fonts/escom.ttf" )
	name:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	name:setShaderVector( 0, 0.06, 0, 0, 0 )
	name:setShaderVector( 1, 0.02, 0, 0, 0 )
	name:setShaderVector( 2, 1, 0, 0, 0 )
	name:setLetterSpacing( 1 )
	name:linkToElementModel( self, "name", true, function ( model )
		local _name = Engine.GetModelValue( model )
		if _name then
			name:setText( Engine.Localize( _name ) )
		end
	end )
	self:addElement( name )
	self.name = name
	
	local requirement = LUI.UIText.new()
	requirement:setLeftRight( true, false, 18, 491 )
	requirement:setTopBottom( true, false, 404, 423 )
	requirement:setAlpha( 0.65 )
	requirement:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	requirement:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	requirement:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	requirement:linkToElementModel( self, "requirement", true, function ( model )
		local _requirement = Engine.GetModelValue( model )
		if _requirement then
			requirement:setText( Engine.Localize( _requirement ) )
		end
	end )
	self:addElement( requirement )
	self.requirement = requirement
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
			end
		},
		NotUnlocked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NotUnlocked",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "unlocked" )
			end
		}
	} )
	self:linkToElementModel( self, "unlocked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlocked"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.icon:close()
		element.xpBonus:close()
		element.name:close()
		element.requirement:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

