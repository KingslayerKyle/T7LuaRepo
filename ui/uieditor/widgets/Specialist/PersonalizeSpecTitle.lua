-- 20ebc2b7b9cd3daea867ec2852776313
-- This hash is used for caching, delete to decompile the file again

CoD.PersonalizeSpecTitle = InheritFrom( LUI.UIElement )
CoD.PersonalizeSpecTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeSpecTitle )
	self.id = "PersonalizeSpecTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 375 )
	self:setTopBottom( true, false, 0, 32 )
	
	local weaponNameLabel = LUI.UITightText.new()
	weaponNameLabel:setLeftRight( true, false, 0, 375 )
	weaponNameLabel:setTopBottom( true, false, 0, 24 )
	weaponNameLabel:setRGB( 0.97, 0.32, 0.05 )
	weaponNameLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponNameLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	weaponNameLabel:setShaderVector( 0, 0, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	weaponNameLabel:setShaderVector( 2, 1, 0, 0, 0 )
	weaponNameLabel:setLetterSpacing( 0.6 )
	weaponNameLabel:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			weaponNameLabel:setText( Engine.Localize( LocalizeToUpperString( name ) ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( weaponNameLabel, "setText", function ( element, controller )
		ScaleWidgetToLabelLeftJustify( self, element, 2 )
		SetStateFromText( self, element, "DefaultState", "NoText" )
	end )
	self:addElement( weaponNameLabel )
	self.weaponNameLabel = weaponNameLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				weaponNameLabel:completeAnimation()
				self.weaponNameLabel:setAlpha( 1 )
				self.clipFinished( weaponNameLabel, {} )
			end
		},
		ShowCurrentlyEquippedInfo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.weaponNameLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

