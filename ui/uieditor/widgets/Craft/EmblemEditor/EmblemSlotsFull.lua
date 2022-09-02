-- cb499d2cbd90ae3bdc3e9a61dddb07fb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.BackgroundPattern01" )

CoD.EmblemSlotsFull = InheritFrom( LUI.UIElement )
CoD.EmblemSlotsFull.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.EmblemSlotsFull )
	self.id = "EmblemSlotsFull"
	self.soundSet = "Paintshop"
	self:setLeftRight( true, false, 0, 448 )
	self:setTopBottom( true, false, 0, 94 )
	self.anyChildUsesUpdateState = true
	
	local CountBacking = LUI.UIImage.new()
	CountBacking:setLeftRight( true, false, 0, 120 )
	CountBacking:setTopBottom( true, false, 0.75, 45.25 )
	CountBacking:setRGB( 0.34, 0.34, 0.34 )
	CountBacking:setAlpha( 0.15 )
	self:addElement( CountBacking )
	self.CountBacking = CountBacking
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( true, false, 0, 120 )
	TitleBacking:setTopBottom( true, false, 0.75, 17.75 )
	TitleBacking:setRGB( 0, 0, 0 )
	TitleBacking:setAlpha( 0.3 )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local BackgroundPattern010 = CoD.BackgroundPattern01.new( menu, controller )
	BackgroundPattern010:setLeftRight( true, false, 0, 120 )
	BackgroundPattern010:setTopBottom( true, false, 0.75, 45.25 )
	BackgroundPattern010:setRGB( 0.22, 0.22, 0.22 )
	BackgroundPattern010:setAlpha( 0.5 )
	self:addElement( BackgroundPattern010 )
	self.BackgroundPattern010 = BackgroundPattern010
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, -1.5, 121.5 )
	Image:setTopBottom( true, false, -0.25, 19 )
	Image:setAlpha( 0.5 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.03, 0.21, 0, 0 )
	Image:setupNineSliceShader( 4, 4 )
	self:addElement( Image )
	self.Image = Image
	
	local count = LUI.UIText.new()
	count:setLeftRight( true, false, 6, 113.5 )
	count:setTopBottom( true, false, 20.75, 42.75 )
	count:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION" ) )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	count:subscribeToGlobalModel( controller, "PerController", "Emblem.UpdateDataSource", function ( model )
		local f2_local0 = count
		if IsLive() then
			UpdateSlotCountText( self, f2_local0, controller, Enum.StorageFileType.STORAGE_EMBLEMS )
		end
	end )
	self:addElement( count )
	self.count = count
	
	local VariantSlots = LUI.UIText.new()
	VariantSlots:setLeftRight( true, false, 0, 120 )
	VariantSlots:setTopBottom( true, false, 1, 17 )
	VariantSlots:setRGB( 0.77, 0.77, 0.77 )
	VariantSlots:setText( Engine.Localize( "MENU_EMBLEM_SLOTS" ) )
	VariantSlots:setTTF( "fonts/default.ttf" )
	VariantSlots:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VariantSlots:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VariantSlots )
	self.VariantSlots = VariantSlots
	
	local slotFulltext = LUI.UIText.new()
	slotFulltext:setLeftRight( true, false, 231.02, 416.02 )
	slotFulltext:setTopBottom( true, false, 30.75, 55.75 )
	slotFulltext:setAlpha( 0 )
	slotFulltext:setText( Engine.Localize( "MENU_PAINTJOB_SOTS_FULL" ) )
	slotFulltext:setTTF( "fonts/default.ttf" )
	slotFulltext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	slotFulltext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( slotFulltext )
	self.slotFulltext = slotFulltext
	
	local WarningBacking = LUI.UIImage.new()
	WarningBacking:setLeftRight( true, false, -2, 6 )
	WarningBacking:setTopBottom( true, false, 4.75, 21.75 )
	WarningBacking:setRGB( 0, 0, 0 )
	WarningBacking:setAlpha( 0 )
	self:addElement( WarningBacking )
	self.WarningBacking = WarningBacking
	
	local slotfullWarningImage = LUI.UIImage.new()
	slotfullWarningImage:setLeftRight( true, false, 199.02, 231.02 )
	slotfullWarningImage:setTopBottom( true, false, 27.25, 59.25 )
	slotfullWarningImage:setRGB( 1, 0, 0 )
	slotfullWarningImage:setAlpha( 0 )
	slotfullWarningImage:setImage( RegisterImage( "uie_t7_icon_error_overlays" ) )
	self:addElement( slotfullWarningImage )
	self.slotfullWarningImage = slotfullWarningImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				count:completeAnimation()
				self.count:setRGB( 1, 1, 1 )
				self.clipFinished( count, {} )

				VariantSlots:completeAnimation()
				self.VariantSlots:setAlpha( 1 )
				self.clipFinished( VariantSlots, {} )

				slotFulltext:completeAnimation()
				self.slotFulltext:setAlpha( 0 )
				self.clipFinished( slotFulltext, {} )

				WarningBacking:completeAnimation()
				self.WarningBacking:setAlpha( 0 )
				self.clipFinished( WarningBacking, {} )

				slotfullWarningImage:completeAnimation()
				self.slotfullWarningImage:setAlpha( 0 )
				self.clipFinished( slotfullWarningImage, {} )
			end
		},
		SlotsFull = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				count:completeAnimation()
				self.count:setRGB( 1, 0, 0 )
				self.clipFinished( count, {} )

				VariantSlots:completeAnimation()
				self.VariantSlots:setLeftRight( true, false, 0, 120 )
				self.VariantSlots:setTopBottom( true, false, 1, 17 )
				self.VariantSlots:setAlpha( 0 )
				self.clipFinished( VariantSlots, {} )

				slotFulltext:completeAnimation()
				self.slotFulltext:setLeftRight( true, false, -0.5, 119.5 )
				self.slotFulltext:setTopBottom( true, false, 1, 17 )
				self.slotFulltext:setRGB( 1, 0, 0 )
				self.slotFulltext:setAlpha( 1 )
				self.slotFulltext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( slotFulltext, {} )

				WarningBacking:completeAnimation()
				self.WarningBacking:setLeftRight( true, false, -4, 4 )
				self.WarningBacking:setTopBottom( true, false, 4.75, 17.75 )
				self.WarningBacking:setAlpha( 1 )
				self.clipFinished( WarningBacking, {} )

				slotfullWarningImage:completeAnimation()
				self.slotfullWarningImage:setLeftRight( true, false, -14.75, 14.75 )
				self.slotfullWarningImage:setTopBottom( true, false, -5, 24.5 )
				self.slotfullWarningImage:setRGB( 1, 0, 0 )
				self.slotfullWarningImage:setAlpha( 1 )
				self.clipFinished( slotfullWarningImage, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				CountBacking:completeAnimation()
				self.CountBacking:setAlpha( 0 )
				self.clipFinished( CountBacking, {} )

				TitleBacking:completeAnimation()
				self.TitleBacking:setAlpha( 0 )
				self.clipFinished( TitleBacking, {} )

				BackgroundPattern010:completeAnimation()
				self.BackgroundPattern010:setAlpha( 0 )
				self.clipFinished( BackgroundPattern010, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )

				count:completeAnimation()
				self.count:setRGB( 1, 1, 1 )
				self.count:setAlpha( 0 )
				self.clipFinished( count, {} )

				VariantSlots:completeAnimation()
				self.VariantSlots:setAlpha( 0 )
				self.clipFinished( VariantSlots, {} )

				slotFulltext:completeAnimation()
				self.slotFulltext:setAlpha( 0 )
				self.clipFinished( slotFulltext, {} )

				WarningBacking:completeAnimation()
				self.WarningBacking:setAlpha( 0 )
				self.clipFinished( WarningBacking, {} )

				slotfullWarningImage:completeAnimation()
				self.slotfullWarningImage:setAlpha( 0 )
				self.clipFinished( slotfullWarningImage, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackgroundPattern010:close()
		element.count:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

