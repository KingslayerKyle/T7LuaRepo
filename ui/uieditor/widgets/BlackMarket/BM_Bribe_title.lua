-- c95395d042e93b07b6dcf120bd1bba16
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Bribe_title = InheritFrom( LUI.UIElement )
CoD.BM_Bribe_title.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Bribe_title )
	self.id = "BM_Bribe_title"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 124 )
	self:setTopBottom( true, false, 0, 54 )
	
	local BribeTitle = LUI.UIImage.new()
	BribeTitle:setLeftRight( true, false, 0, 46.43 )
	BribeTitle:setTopBottom( true, false, 0, 54.17 )
	BribeTitle:setImage( RegisterImage( "uie_t7_blackmarket_genericpromo_title_bg_left" ) )
	self:addElement( BribeTitle )
	self.BribeTitle = BribeTitle
	
	local BribeTitle1Add = LUI.UIImage.new()
	BribeTitle1Add:setLeftRight( true, false, 0, 46.43 )
	BribeTitle1Add:setTopBottom( true, false, 0, 54.17 )
	BribeTitle1Add:setRGB( 1, 0.69, 0.26 )
	BribeTitle1Add:setAlpha( 0 )
	BribeTitle1Add:setImage( RegisterImage( "uie_t7_blackmarket_genericpromo_title_bg_left" ) )
	BribeTitle1Add:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BribeTitle1Add )
	self.BribeTitle1Add = BribeTitle1Add
	
	local BribeTitle0 = LUI.UIImage.new()
	BribeTitle0:setLeftRight( true, true, 46.43, -38.88 )
	BribeTitle0:setTopBottom( true, false, 0, 54.17 )
	BribeTitle0:setImage( RegisterImage( "uie_t7_blackmarket_genericpromo_title_bg_center" ) )
	self:addElement( BribeTitle0 )
	self.BribeTitle0 = BribeTitle0
	
	local BribeTitle0Add = LUI.UIImage.new()
	BribeTitle0Add:setLeftRight( true, true, 46.43, -38.88 )
	BribeTitle0Add:setTopBottom( true, false, 0, 54.17 )
	BribeTitle0Add:setRGB( 1, 0.69, 0.26 )
	BribeTitle0Add:setAlpha( 0 )
	BribeTitle0Add:setImage( RegisterImage( "uie_t7_blackmarket_genericpromo_title_bg_center" ) )
	BribeTitle0Add:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BribeTitle0Add )
	self.BribeTitle0Add = BribeTitle0Add
	
	local BribeTitle00 = LUI.UIImage.new()
	BribeTitle00:setLeftRight( false, true, -38.88, -0.19 )
	BribeTitle00:setTopBottom( true, false, 0, 54.17 )
	BribeTitle00:setImage( RegisterImage( "uie_t7_blackmarket_genericpromo_title_bg_right" ) )
	self:addElement( BribeTitle00 )
	self.BribeTitle00 = BribeTitle00
	
	local BribeTitleAdd = LUI.UIImage.new()
	BribeTitleAdd:setLeftRight( false, true, -38.88, -0.19 )
	BribeTitleAdd:setTopBottom( true, false, 0, 54.17 )
	BribeTitleAdd:setRGB( 1, 0.69, 0.26 )
	BribeTitleAdd:setAlpha( 0 )
	BribeTitleAdd:setImage( RegisterImage( "uie_t7_blackmarket_genericpromo_title_bg_right" ) )
	BribeTitleAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BribeTitleAdd )
	self.BribeTitleAdd = BribeTitleAdd
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 20.49, 123.81 )
	title:setTopBottom( true, false, 1, 26 )
	title:setRGB( 0, 0, 0 )
	title:setText( LocalizeToUpperString( "MPUI_BM_BRIBE" ) )
	title:setTTF( "fonts/default.ttf" )
	title:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	title:setShaderVector( 0, 0.03, 0, 0, 0 )
	title:setShaderVector( 1, 0.01, 0, 0, 0 )
	title:setShaderVector( 2, 1, 0, 0, 0 )
	title:setLetterSpacing( 0.3 )

	LUI.OverrideFunction_CallOriginalFirst( title, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 20 )
	end )
	self:addElement( title )
	self.title = title
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BribeTitle:completeAnimation()
				self.BribeTitle:setRGB( 1, 1, 1 )
				self.clipFinished( BribeTitle, {} )

				BribeTitle1Add:completeAnimation()
				self.BribeTitle1Add:setAlpha( 0 )
				self.clipFinished( BribeTitle1Add, {} )

				BribeTitle0:completeAnimation()
				self.BribeTitle0:setRGB( 1, 1, 1 )
				self.clipFinished( BribeTitle0, {} )

				BribeTitle0Add:completeAnimation()
				self.BribeTitle0Add:setAlpha( 0 )
				self.clipFinished( BribeTitle0Add, {} )

				BribeTitle00:completeAnimation()
				self.BribeTitle00:setRGB( 1, 1, 1 )
				self.clipFinished( BribeTitle00, {} )

				BribeTitleAdd:completeAnimation()
				self.BribeTitleAdd:setAlpha( 0 )
				self.clipFinished( BribeTitleAdd, {} )
			end
		},
		GoldFrame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BribeTitle:completeAnimation()
				self.BribeTitle:setRGB( 1, 0.78, 0.47 )
				self.clipFinished( BribeTitle, {} )

				BribeTitle1Add:completeAnimation()
				self.BribeTitle1Add:setRGB( 1, 0.69, 0.26 )
				self.BribeTitle1Add:setAlpha( 0.5 )
				self.BribeTitle1Add:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( BribeTitle1Add, {} )

				BribeTitle0:completeAnimation()
				self.BribeTitle0:setRGB( 1, 0.78, 0.47 )
				self.clipFinished( BribeTitle0, {} )

				BribeTitle0Add:completeAnimation()
				self.BribeTitle0Add:setRGB( 1, 0.69, 0.26 )
				self.BribeTitle0Add:setAlpha( 0.5 )
				self.BribeTitle0Add:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( BribeTitle0Add, {} )

				BribeTitle00:completeAnimation()
				self.BribeTitle00:setRGB( 1, 0.78, 0.47 )
				self.clipFinished( BribeTitle00, {} )

				BribeTitleAdd:completeAnimation()
				self.BribeTitleAdd:setRGB( 1, 0.69, 0.26 )
				self.BribeTitleAdd:setAlpha( 0.5 )
				self.BribeTitleAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( BribeTitleAdd, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

