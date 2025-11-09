require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_IconSections2" )

CoD.AbilityWheel_IconContainer = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_IconContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.AbilityWheel_IconContainer )
	self.id = "AbilityWheel_IconContainer"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 376 )
	self:setTopBottom( true, false, 0, 212 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local GradBracketR = LUI.UIImage.new()
	GradBracketR:setLeftRight( false, false, -52, 188 )
	GradBracketR:setTopBottom( false, false, -106, -2 )
	GradBracketR:setRGB( 1, 1, 1 )
	GradBracketR:setYRot( -180 )
	GradBracketR:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_gradbracket" ) )
	GradBracketR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GradBracketR )
	self.GradBracketR = GradBracketR
	
	local GrabBrakcetL = LUI.UIImage.new()
	GrabBrakcetL:setLeftRight( false, false, -188, 52 )
	GrabBrakcetL:setTopBottom( false, false, -106, -2 )
	GrabBrakcetL:setRGB( 1, 1, 1 )
	GrabBrakcetL:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_gradbracket" ) )
	GrabBrakcetL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GrabBrakcetL )
	self.GrabBrakcetL = GrabBrakcetL
	
	local Bracket = LUI.UIImage.new()
	Bracket:setLeftRight( false, false, -95, 93 )
	Bracket:setTopBottom( false, false, -60, -8 )
	Bracket:setRGB( 1, 1, 1 )
	Bracket:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconbracket" ) )
	Bracket:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bracket )
	self.Bracket = Bracket
	
	local Semi = LUI.UIImage.new()
	Semi:setLeftRight( false, false, -69, 71 )
	Semi:setTopBottom( false, false, -84, -60 )
	Semi:setRGB( 1, 1, 1 )
	Semi:setAlpha( 0.38 )
	Semi:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconsemi" ) )
	Semi:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Semi )
	self.Semi = Semi
	
	local IconHex = LUI.UIImage.new()
	IconHex:setLeftRight( false, false, -51, 53 )
	IconHex:setTopBottom( false, false, -27, 93 )
	IconHex:setRGB( 1, 1, 1 )
	IconHex:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconhex" ) )
	IconHex:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IconHex )
	self.IconHex = IconHex
	
	local IconHexLine = LUI.UIImage.new()
	IconHexLine:setLeftRight( true, false, 185, 193 )
	IconHexLine:setTopBottom( true, false, 194, 206 )
	IconHexLine:setRGB( 1, 1, 1 )
	IconHexLine:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconhexlower" ) )
	IconHexLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IconHexLine )
	self.IconHexLine = IconHexLine
	
	local SemiDoop = LUI.UIImage.new()
	SemiDoop:setLeftRight( false, false, -45.83, 47.83 )
	SemiDoop:setTopBottom( false, false, 89.94, 106 )
	SemiDoop:setRGB( 1, 1, 1 )
	SemiDoop:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconsemi" ) )
	SemiDoop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( SemiDoop )
	self.SemiDoop = SemiDoop
	
	local IconHexDoop = LUI.UIImage.new()
	IconHexDoop:setLeftRight( false, false, -40, 42 )
	IconHexDoop:setTopBottom( false, false, -4, 91 )
	IconHexDoop:setRGB( 1, 1, 1 )
	IconHexDoop:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconhex" ) )
	IconHexDoop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IconHexDoop )
	self.IconHexDoop = IconHexDoop
	
	local AbilityIcon = LUI.UIImage.new()
	AbilityIcon:setLeftRight( false, false, -40, 42 )
	AbilityIcon:setTopBottom( false, false, -6, 76 )
	AbilityIcon:setRGB( 1, 1, 1 )
	AbilityIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	AbilityIcon:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AbilityIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	AbilityIcon:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		if AlwaysTrue() then
			HideWidget( self )
			SetElementState( self, element, controller, "Focus" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	AbilityIcon:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		if AlwaysTrue() then
			ShowWidget( self )
			SetElementState( self, element, controller, "DefaultState" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( AbilityIcon )
	self.AbilityIcon = AbilityIcon
	
	local AbilityWheelPixel0 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel0:setLeftRight( false, false, -62, -54 )
	AbilityWheelPixel0:setTopBottom( false, false, -1, 7 )
	AbilityWheelPixel0:setRGB( 1, 1, 1 )
	self:addElement( AbilityWheelPixel0 )
	self.AbilityWheelPixel0 = AbilityWheelPixel0
	
	local AbilityWheelPixel1 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel1:setLeftRight( false, false, 56, 64 )
	AbilityWheelPixel1:setTopBottom( false, false, -1, 7 )
	AbilityWheelPixel1:setRGB( 1, 1, 1 )
	self:addElement( AbilityWheelPixel1 )
	self.AbilityWheelPixel1 = AbilityWheelPixel1
	
	local AbilityWheelPixel2 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel2:setLeftRight( false, false, -62, -54 )
	AbilityWheelPixel2:setTopBottom( false, false, -1, 7 )
	AbilityWheelPixel2:setRGB( 1, 1, 1 )
	self:addElement( AbilityWheelPixel2 )
	self.AbilityWheelPixel2 = AbilityWheelPixel2
	
	local AbilityWheelPixel3 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel3:setLeftRight( false, false, 56, 64 )
	AbilityWheelPixel3:setTopBottom( false, false, 67, 75 )
	AbilityWheelPixel3:setRGB( 1, 1, 1 )
	self:addElement( AbilityWheelPixel3 )
	self.AbilityWheelPixel3 = AbilityWheelPixel3
	
	local AbilityWheelPixel4 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel4:setLeftRight( false, false, -62, -54 )
	AbilityWheelPixel4:setTopBottom( false, false, 67, 75 )
	AbilityWheelPixel4:setRGB( 1, 1, 1 )
	self:addElement( AbilityWheelPixel4 )
	self.AbilityWheelPixel4 = AbilityWheelPixel4
	
	local BracketDoop = LUI.UIImage.new()
	BracketDoop:setLeftRight( false, false, -95, 93 )
	BracketDoop:setTopBottom( false, false, -37, 15 )
	BracketDoop:setRGB( 1, 0.61, 0 )
	BracketDoop:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconbracket" ) )
	BracketDoop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BracketDoop )
	self.BracketDoop = BracketDoop
	
	local AbilityWheelPixel5 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel5:setLeftRight( false, false, -3, 5 )
	AbilityWheelPixel5:setTopBottom( false, false, -51, -43 )
	AbilityWheelPixel5:setRGB( 1, 1, 1 )
	self:addElement( AbilityWheelPixel5 )
	self.AbilityWheelPixel5 = AbilityWheelPixel5
	
	local IconSections1 = CoD.AbilityWheel_IconSections2.new( menu, controller )
	IconSections1:setLeftRight( false, false, -61, 63 )
	IconSections1:setTopBottom( false, false, 5, 86 )
	IconSections1:setRGB( 1, 1, 1 )
	self:addElement( IconSections1 )
	self.IconSections1 = IconSections1
	
	local PixelHex = LUI.UIImage.new()
	PixelHex:setLeftRight( true, false, 181, 197 )
	PixelHex:setTopBottom( true, false, 47, 67 )
	PixelHex:setRGB( 1, 1, 1 )
	PixelHex:setAlpha( 0.7 )
	PixelHex:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_icontophex" ) )
	PixelHex:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PixelHex )
	self.PixelHex = PixelHex
	
	local focusSound = LUI.UIElement.new()
	focusSound:setLeftRight( true, false, 368.14, 416.14 )
	focusSound:setTopBottom( true, false, 68.94, 116.94 )
	self:addElement( focusSound )
	self.focusSound = focusSound
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local BracketDoopFrame2 = function ( BracketDoop, event )
					if not event.interrupted then
						BracketDoop:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					BracketDoop:setRGB( 1, 0.61, 0 )
					if event.interrupted then
						self.clipFinished( BracketDoop, event )
					else
						BracketDoop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BracketDoop:completeAnimation()
				self.BracketDoop:setRGB( 1, 1, 1 )
				BracketDoopFrame2( BracketDoop, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				local BracketDoopFrame2 = function ( BracketDoop, event )
					if not event.interrupted then
						BracketDoop:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
					end
					BracketDoop:setRGB( 0.14, 1, 0 )
					if event.interrupted then
						self.clipFinished( BracketDoop, event )
					else
						BracketDoop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BracketDoop:completeAnimation()
				self.BracketDoop:setRGB( 1, 1, 1 )
				BracketDoopFrame2( BracketDoop, {} )
			end
		},
		Focus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BracketDoop:completeAnimation()
				self.BracketDoop:setRGB( 1, 0, 0 )
				self.clipFinished( BracketDoop, {} )
			end
		}
	}
	self.close = function ( self )
		self.AbilityWheelPixel0:close()
		self.AbilityWheelPixel1:close()
		self.AbilityWheelPixel2:close()
		self.AbilityWheelPixel3:close()
		self.AbilityWheelPixel4:close()
		self.AbilityWheelPixel5:close()
		self.IconSections1:close()
		self.AbilityIcon:close()
		CoD.AbilityWheel_IconContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

