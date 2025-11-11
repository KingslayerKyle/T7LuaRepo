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
	self:setLeftRight( 0, 0, 0, 144 )
	self:setTopBottom( 0, 0, 0, 114 )
	
	local ImageX = LUI.UIImage.new()
	ImageX:setLeftRight( 0, 0, -3, 51 )
	ImageX:setTopBottom( 0, 0, -3, 51 )
	ImageX:setImage( RegisterImage( "uie_t7_menu_frontend_slidex" ) )
	ImageX:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ImageX:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImageX:setAlpha( HideIfNotEmptyString( modelValue ) )
		end
	end )
	self:addElement( ImageX )
	self.ImageX = ImageX
	
	local ImageBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder:setLeftRight( 0, 0, 0, 48 )
	ImageBorder:setTopBottom( 0, 0, 0, 46 )
	self:addElement( ImageBorder )
	self.ImageBorder = ImageBorder
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, -1, 48 )
	Background:setTopBottom( 0, 0, 0, 46 )
	Background:setRGB( 0.6, 0.6, 0.42 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local TierText = LUI.UIText.new()
	TierText:setLeftRight( 0, 0, -27, 55 )
	TierText:setTopBottom( 0, 0, 9, 39 )
	TierText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TierText:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	TierText:setShaderVector( 0, 0.02, 0, 0, 0 )
	TierText:setShaderVector( 1, 0.06, 0, 0, 0 )
	TierText:setShaderVector( 2, 1, 0, 0, 0 )
	TierText:setLetterSpacing( 2 )
	TierText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TierText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( TierText )
	self.TierText = TierText
	
	local CurrentTierArrow = LUI.UIImage.new()
	CurrentTierArrow:setLeftRight( 0, 0, 0, 48 )
	CurrentTierArrow:setTopBottom( 1, 1, -80, -32 )
	CurrentTierArrow:setZRot( 180 )
	CurrentTierArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( CurrentTierArrow )
	self.CurrentTierArrow = CurrentTierArrow
	
	local XPIcon = LUI.UIImage.new()
	XPIcon:setLeftRight( 0, 0, 0, 48 )
	XPIcon:setTopBottom( 1, 1, -48, 0 )
	XPIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	self:addElement( XPIcon )
	self.XPIcon = XPIcon
	
	local XPText = LUI.UIText.new()
	XPText:setLeftRight( 0, 0, 51, 144 )
	XPText:setTopBottom( 1, 1, -39, -9 )
	XPText:setTTF( "fonts/default.ttf" )
	XPText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XPText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( XPText )
	self.XPText = XPText
	
	local box = LUI.UIImage.new()
	box:setLeftRight( 0, 0, -1, 48 )
	box:setTopBottom( 0, 0, 44, 47 )
	box:setAlpha( 0.8 )
	box:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	box:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( box )
	self.box = box
	
	self.TierText:linkToElementModel( self, "tierText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TierText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.XPText:linkToElementModel( self, "tierXP", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			XPText:setText( LocalizeIntoString( "CPUI_XP_BONUS", modelValue ) )
		end
	end )
	self.resetProperties = function ()
		XPIcon:completeAnimation()
		XPText:completeAnimation()
		CurrentTierArrow:completeAnimation()
		box:completeAnimation()
		Background:completeAnimation()
		TierText:completeAnimation()
		ImageX:completeAnimation()
		XPIcon:setAlpha( 1 )
		XPText:setAlpha( 1 )
		CurrentTierArrow:setAlpha( 1 )
		box:setAlpha( 0.8 )
		Background:setRGB( 0.6, 0.6, 0.42 )
		Background:setAlpha( 0 )
		TierText:setRGB( 1, 1, 1 )
		ImageX:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
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
				self.resetProperties()
				self:setupElementClipCounter( 4 )
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
				self.resetProperties()
				self:setupElementClipCounter( 3 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ImageBorder:close()
		self.ImageX:close()
		self.TierText:close()
		self.XPText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

