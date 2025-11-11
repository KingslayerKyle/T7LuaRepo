require( "ui.uieditor.widgets.BackgroundFrames.BackgroundPattern01" )

CoD.PaintshopSlotsFull = InheritFrom( LUI.UIElement )
CoD.PaintshopSlotsFull.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintshopSlotsFull )
	self.id = "PaintshopSlotsFull"
	self.soundSet = "Paintshop"
	self:setLeftRight( 0, 0, 0, 672 )
	self:setTopBottom( 0, 0, 0, 141 )
	
	local CountBacking = LUI.UIImage.new()
	CountBacking:setLeftRight( 0, 0, 0, 180 )
	CountBacking:setTopBottom( 0, 0, 1, 68 )
	CountBacking:setRGB( 0.34, 0.34, 0.34 )
	CountBacking:setAlpha( 0.15 )
	self:addElement( CountBacking )
	self.CountBacking = CountBacking
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( 0, 0, 0, 180 )
	TitleBacking:setTopBottom( 0, 0, 1, 26 )
	TitleBacking:setRGB( 0, 0, 0 )
	TitleBacking:setAlpha( 0.3 )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local BackgroundPattern010 = CoD.BackgroundPattern01.new( menu, controller )
	BackgroundPattern010:setLeftRight( 0, 0, 0, 180 )
	BackgroundPattern010:setTopBottom( 0, 0, 1, 68 )
	BackgroundPattern010:setRGB( 0.22, 0.22, 0.22 )
	BackgroundPattern010:setAlpha( 0.5 )
	self:addElement( BackgroundPattern010 )
	self.BackgroundPattern010 = BackgroundPattern010
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 0, -2, 182 )
	Image:setTopBottom( 0, 0, 0, 29 )
	Image:setAlpha( 0.5 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0, 0, 0, 0 )
	Image:setupNineSliceShader( 6, 6 )
	self:addElement( Image )
	self.Image = Image
	
	local count = LUI.UIText.new()
	count:setLeftRight( 0, 0, 9, 170 )
	count:setTopBottom( 0, 0, 31, 64 )
	count:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION" ) )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	count:subscribeToGlobalModel( controller, "PerController", "Paintshop.UpdateDataSource", function ( model )
		local element = count
		UpdateSlotCountText( self, element, controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	end )
	self:addElement( count )
	self.count = count
	
	local VariantSlots = LUI.UIText.new()
	VariantSlots:setLeftRight( 0, 0, 0, 180 )
	VariantSlots:setTopBottom( 0, 0, 2, 26 )
	VariantSlots:setRGB( 0.77, 0.77, 0.77 )
	VariantSlots:setText( Engine.Localize( "MENU_PAINTJOB_SLOTS" ) )
	VariantSlots:setTTF( "fonts/default.ttf" )
	VariantSlots:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VariantSlots:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VariantSlots )
	self.VariantSlots = VariantSlots
	
	local slotFulltext = LUI.UIText.new()
	slotFulltext:setLeftRight( 0, 0, 346, 624 )
	slotFulltext:setTopBottom( 0, 0, 46, 84 )
	slotFulltext:setAlpha( 0 )
	slotFulltext:setText( Engine.Localize( "MENU_PAINTJOB_SOTS_FULL" ) )
	slotFulltext:setTTF( "fonts/default.ttf" )
	slotFulltext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	slotFulltext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( slotFulltext )
	self.slotFulltext = slotFulltext
	
	local WarningBacking = LUI.UIImage.new()
	WarningBacking:setLeftRight( 0, 0, -3, 9 )
	WarningBacking:setTopBottom( 0, 0, 7, 32 )
	WarningBacking:setRGB( 0, 0, 0 )
	WarningBacking:setAlpha( 0 )
	self:addElement( WarningBacking )
	self.WarningBacking = WarningBacking
	
	local slotfullWarningImage = LUI.UIImage.new()
	slotfullWarningImage:setLeftRight( 0, 0, 299, 347 )
	slotfullWarningImage:setTopBottom( 0, 0, 41, 89 )
	slotfullWarningImage:setRGB( 1, 0, 0 )
	slotfullWarningImage:setAlpha( 0 )
	slotfullWarningImage:setImage( RegisterImage( "t7_icon_error_overlays" ) )
	self:addElement( slotfullWarningImage )
	self.slotfullWarningImage = slotfullWarningImage
	
	self.resetProperties = function ()
		slotFulltext:completeAnimation()
		slotfullWarningImage:completeAnimation()
		count:completeAnimation()
		VariantSlots:completeAnimation()
		WarningBacking:completeAnimation()
		slotFulltext:setLeftRight( 0, 0, 346, 624 )
		slotFulltext:setTopBottom( 0, 0, 46, 84 )
		slotFulltext:setRGB( 1, 1, 1 )
		slotFulltext:setAlpha( 0 )
		slotFulltext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
		slotfullWarningImage:setLeftRight( 0, 0, 299, 347 )
		slotfullWarningImage:setTopBottom( 0, 0, 41, 89 )
		slotfullWarningImage:setAlpha( 0 )
		count:setRGB( 1, 1, 1 )
		VariantSlots:setAlpha( 1 )
		WarningBacking:setLeftRight( 0, 0, -3, 9 )
		WarningBacking:setTopBottom( 0, 0, 7, 32 )
		WarningBacking:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		SlotsFull = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				count:completeAnimation()
				self.count:setRGB( 1, 0, 0 )
				self.clipFinished( count, {} )
				VariantSlots:completeAnimation()
				self.VariantSlots:setAlpha( 0 )
				self.clipFinished( VariantSlots, {} )
				slotFulltext:completeAnimation()
				self.slotFulltext:setLeftRight( 0, 0, -1, 179 )
				self.slotFulltext:setTopBottom( 0, 0, 2, 26 )
				self.slotFulltext:setRGB( 1, 0, 0 )
				self.slotFulltext:setAlpha( 1 )
				self.slotFulltext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( slotFulltext, {} )
				WarningBacking:completeAnimation()
				self.WarningBacking:setLeftRight( 0, 0, -6, 6 )
				self.WarningBacking:setTopBottom( 0, 0, 7, 26 )
				self.WarningBacking:setAlpha( 1 )
				self.clipFinished( WarningBacking, {} )
				slotfullWarningImage:completeAnimation()
				self.slotfullWarningImage:setLeftRight( 0, 0, -22, 22 )
				self.slotfullWarningImage:setTopBottom( 0, 0, -7, 37 )
				self.slotfullWarningImage:setAlpha( 1 )
				self.clipFinished( slotfullWarningImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BackgroundPattern010:close()
		self.count:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

