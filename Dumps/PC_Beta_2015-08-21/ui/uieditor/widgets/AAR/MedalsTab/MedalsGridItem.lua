require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.MedalsGridItem = InheritFrom( LUI.UIElement )
CoD.MedalsGridItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MedalsGridItem )
	self.id = "MedalsGridItem"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 170 )
	self:setTopBottom( true, false, 0, 139 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local MedalBg = LUI.UIImage.new()
	MedalBg:setLeftRight( true, true, 0, 0 )
	MedalBg:setTopBottom( true, true, 0, 0 )
	MedalBg:setRGB( 0, 0, 0 )
	MedalBg:setAlpha( 0.1 )
	self:addElement( MedalBg )
	self.MedalBg = MedalBg
	
	local MedalNameBg = LUI.UIImage.new()
	MedalNameBg:setLeftRight( true, true, 0, -0.22 )
	MedalNameBg:setTopBottom( false, true, -24.67, 0.33 )
	MedalNameBg:setRGB( 0, 0, 0 )
	MedalNameBg:setAlpha( 0.21 )
	self:addElement( MedalNameBg )
	self.MedalNameBg = MedalNameBg
	
	local MedalName = LUI.UIText.new()
	MedalName:setLeftRight( true, true, 6, -5.22 )
	MedalName:setTopBottom( false, false, 44.83, 69.83 )
	MedalName:setTTF( "fonts/default.ttf" )
	MedalName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MedalName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MedalName )
	self.MedalName = MedalName
	
	local Times = LUI.UITightText.new()
	Times:setLeftRight( true, false, 6, 27 )
	Times:setTopBottom( false, false, 19.83, 44.83 )
	Times:setTTF( "fonts/default.ttf" )
	self:addElement( Times )
	self.Times = Times
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, false, 0, 170 )
	Border:setTopBottom( true, false, 0, 139.33 )
	self:addElement( Border )
	self.Border = Border
	
	local MedalImageBacking = LUI.UIImage.new()
	MedalImageBacking:setLeftRight( true, true, 34.81, -34.03 )
	MedalImageBacking:setTopBottom( true, false, 6.16, 107.33 )
	MedalImageBacking:setupUIStreamedImage( 0 )
	self:addElement( MedalImageBacking )
	self.MedalImageBacking = MedalImageBacking
	
	local MedalImage = LUI.UIImage.new()
	MedalImage:setLeftRight( true, true, 34.81, -34.03 )
	MedalImage:setTopBottom( true, false, 6.16, 107.33 )
	MedalImage:setupUIStreamedImage( 0 )
	self:addElement( MedalImage )
	self.MedalImage = MedalImage
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, 0, 4 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, -5, 4 )
	glitch:setTopBottom( true, false, -9.75, 3.75 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, -5, 4 )
	glitch2:setTopBottom( false, true, -5, 10 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	self.MedalName:linkToElementModel( self, "medalIndex", true, function ( model )
		local medalIndex = Engine.GetModelValue( model )
		if medalIndex then
			MedalName:setText( GetAARMedalName( medalIndex ) )
		end
	end )
	self.Times:linkToElementModel( self, "medalTimesObtained", true, function ( model )
		local medalTimesObtained = Engine.GetModelValue( model )
		if medalTimesObtained then
			Times:setText( Engine.Localize( GetAARMedalHitCount( medalTimesObtained ) ) )
		end
	end )
	self.MedalImageBacking:linkToElementModel( self, "medalIndex", true, function ( model )
		local medalIndex = Engine.GetModelValue( model )
		if medalIndex then
			MedalImageBacking:setImage( RegisterImage( GetAARMedalImageBackingSmall( medalIndex ) ) )
		end
	end )
	self.MedalImage:linkToElementModel( self, "medalIndex", true, function ( model )
		local medalIndex = Engine.GetModelValue( model )
		if medalIndex then
			MedalImage:setImage( RegisterImage( GetAARMedalImageSmall( medalIndex ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				MedalBg:completeAnimation()
				self.MedalBg:setAlpha( 0.1 )
				self.clipFinished( MedalBg, {} )
				MedalNameBg:completeAnimation()
				self.MedalNameBg:setAlpha( 0.21 )
				self.clipFinished( MedalNameBg, {} )
				MedalName:completeAnimation()
				self.MedalName:setAlpha( 1 )
				self.clipFinished( MedalName, {} )
				Times:completeAnimation()
				self.Times:setAlpha( 1 )
				self.clipFinished( Times, {} )
				Border:completeAnimation()
				self.Border:setRGB( 1, 1, 1 )
				self.Border:setAlpha( 1 )
				self.clipFinished( Border, {} )
				MedalImageBacking:completeAnimation()
				self.MedalImageBacking:setAlpha( 1 )
				self.clipFinished( MedalImageBacking, {} )
				MedalImage:completeAnimation()
				self.MedalImage:setAlpha( 1 )
				self.clipFinished( MedalImage, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 11 )
				MedalBg:completeAnimation()
				self.MedalBg:setAlpha( 0.1 )
				self.clipFinished( MedalBg, {} )
				MedalNameBg:completeAnimation()
				self.MedalNameBg:setAlpha( 0.21 )
				self.clipFinished( MedalNameBg, {} )
				MedalName:completeAnimation()
				self.MedalName:setAlpha( 1 )
				self.clipFinished( MedalName, {} )
				Times:completeAnimation()
				self.Times:setAlpha( 1 )
				self.clipFinished( Times, {} )
				Border:completeAnimation()
				self.Border:setRGB( 1, 1, 1 )
				self.clipFinished( Border, {} )
				MedalImageBacking:completeAnimation()
				self.MedalImageBacking:setAlpha( 1 )
				self.clipFinished( MedalImageBacking, {} )
				MedalImage:completeAnimation()
				self.MedalImage:setAlpha( 1 )
				self.clipFinished( MedalImage, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 1 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				self.clipFinished( glitch2, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Border:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.MedalName:close()
		element.Times:close()
		element.MedalImageBacking:close()
		element.MedalImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

