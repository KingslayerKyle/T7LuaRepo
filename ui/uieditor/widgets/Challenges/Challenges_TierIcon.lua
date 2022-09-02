-- bc5411d2579a97e26941a54ad2168994
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.Challenges_TierIcon = InheritFrom( LUI.UIElement )
CoD.Challenges_TierIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Challenges_TierIcon )
	self.id = "Challenges_TierIcon"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 76 )
	
	local ImageX = LUI.UIImage.new()
	ImageX:setLeftRight( true, false, -2, 34 )
	ImageX:setTopBottom( true, false, -2, 34 )
	ImageX:setImage( RegisterImage( "uie_t7_menu_frontend_slidex" ) )
	ImageX:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ImageX:linkToElementModel( self, "rankIcon", true, function ( model )
		local rankIcon = Engine.GetModelValue( model )
		if rankIcon then
			ImageX:setAlpha( HideIfNotEmptyString( rankIcon ) )
		end
	end )
	self:addElement( ImageX )
	self.ImageX = ImageX
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( true, false, 0, 32 )
	ImageBorder:setTopBottom( true, false, 0, 31 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, -0.5, 32 )
	Background:setTopBottom( true, false, 0, 31 )
	Background:setRGB( 0.6, 0.6, 0.42 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local TierText = LUI.UIText.new()
	TierText:setLeftRight( true, false, -18, 37 )
	TierText:setTopBottom( true, false, 6, 26 )
	TierText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TierText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TierText:setShaderVector( 0, 0.02, 0, 0, 0 )
	TierText:setShaderVector( 1, 0.06, 0, 0, 0 )
	TierText:setShaderVector( 2, 1, 0, 0, 0 )
	TierText:setLetterSpacing( 2 )
	TierText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TierText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( TierText )
	self.TierText = TierText
	
	local CurrentTierArrow = LUI.UIImage.new()
	CurrentTierArrow:setLeftRight( true, false, 0, 32 )
	CurrentTierArrow:setTopBottom( false, true, -53, -21 )
	CurrentTierArrow:setZRot( 180 )
	CurrentTierArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( CurrentTierArrow )
	self.CurrentTierArrow = CurrentTierArrow
	
	local XPIcon = LUI.UIImage.new()
	XPIcon:setLeftRight( true, false, 0, 32 )
	XPIcon:setTopBottom( false, true, -32, 0 )
	XPIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	self:addElement( XPIcon )
	self.XPIcon = XPIcon
	
	local XPText = LUI.UIText.new()
	XPText:setLeftRight( true, false, 34, 96 )
	XPText:setTopBottom( false, true, -26, -6 )
	XPText:setTTF( "fonts/default.ttf" )
	XPText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XPText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( XPText )
	self.XPText = XPText
	
	local box = LUI.UIImage.new()
	box:setLeftRight( true, false, -0.5, 32 )
	box:setTopBottom( true, false, 29.5, 31.5 )
	box:setAlpha( 0.8 )
	box:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	box:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( box )
	self.box = box
	
	self.TierText:linkToElementModel( self, "tierText", true, function ( model )
		local tierText = Engine.GetModelValue( model )
		if tierText then
			TierText:setText( Engine.Localize( tierText ) )
		end
	end )
	self.XPText:linkToElementModel( self, "tierXP", true, function ( model )
		local tierXP = Engine.GetModelValue( model )
		if tierXP then
			XPText:setText( Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", tierXP ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				Background:completeAnimation()
				self.Background:setRGB( 0.6, 0.6, 0.42 )
				self.clipFinished( Background, {} )

				TierText:completeAnimation()
				self.TierText:setRGB( 1, 1, 1 )
				self.clipFinished( TierText, {} )

				CurrentTierArrow:completeAnimation()
				self.CurrentTierArrow:setAlpha( 0 )
				self.clipFinished( CurrentTierArrow, {} )

				XPIcon:completeAnimation()
				self.XPIcon:setAlpha( 0 )
				self.clipFinished( XPIcon, {} )

				XPText:completeAnimation()
				self.XPText:setAlpha( 0 )
				self.clipFinished( XPText, {} )

				box:completeAnimation()
				self.box:setAlpha( 0 )
				self.clipFinished( box, {} )
			end
		},
		Unreached = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				Background:completeAnimation()
				self.Background:setRGB( 0.6, 0.6, 0.42 )
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )

				TierText:completeAnimation()
				self.TierText:setRGB( 1, 1, 1 )
				self.clipFinished( TierText, {} )

				CurrentTierArrow:completeAnimation()
				self.CurrentTierArrow:setAlpha( 0 )
				self.clipFinished( CurrentTierArrow, {} )

				XPIcon:completeAnimation()
				self.XPIcon:setAlpha( 0 )
				self.clipFinished( XPIcon, {} )

				XPText:completeAnimation()
				self.XPText:setAlpha( 0 )
				self.clipFinished( XPText, {} )

				box:completeAnimation()
				self.box:setAlpha( 0 )
				self.clipFinished( box, {} )
			end
		},
		CurrentTier = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				ImageX:completeAnimation()
				self.ImageX:setRGB( 0, 0, 0 )
				self.clipFinished( ImageX, {} )

				Background:completeAnimation()
				self.Background:setRGB( 1, 0.93, 0 )
				self.Background:setAlpha( 0.7 )
				self.clipFinished( Background, {} )

				TierText:completeAnimation()
				self.TierText:setRGB( 0, 0, 0 )
				self.clipFinished( TierText, {} )

				CurrentTierArrow:completeAnimation()
				self.CurrentTierArrow:setAlpha( 1 )
				self.clipFinished( CurrentTierArrow, {} )

				XPIcon:completeAnimation()
				self.XPIcon:setAlpha( 1 )
				self.clipFinished( XPIcon, {} )

				XPText:completeAnimation()
				self.XPText:setLeftRight( true, false, 34, 96 )
				self.XPText:setTopBottom( false, true, -26, -6 )
				self.XPText:setAlpha( 1 )
				self.clipFinished( XPText, {} )

				box:completeAnimation()
				self.box:setAlpha( 0.8 )
				self.clipFinished( box, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Unreached",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isReached" )
			end
		},
		{
			stateName = "CurrentTier",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isCurrentTier" )
			end
		}
	} )
	self:linkToElementModel( self, "isReached", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isReached"
		} )
	end )
	self:linkToElementModel( self, "isCurrentTier", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isCurrentTier"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ImageBorder:close()
		element.ImageX:close()
		element.TierText:close()
		element.XPText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

