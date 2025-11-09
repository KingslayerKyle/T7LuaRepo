require( "ui.uieditor.widgets.Paintshop.PaintjobSlotsBack" )

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
	self:setLeftRight( true, false, 0, 448 )
	self:setTopBottom( true, false, 0, 94 )
	self.anyChildUsesUpdateState = true
	
	local PaintjobSlotsBack0 = CoD.PaintjobSlotsBack.new( menu, controller )
	PaintjobSlotsBack0:setLeftRight( true, false, 8, 198 )
	PaintjobSlotsBack0:setTopBottom( true, false, 32.75, 80.25 )
	self:addElement( PaintjobSlotsBack0 )
	self.PaintjobSlotsBack0 = PaintjobSlotsBack0
	
	local paintjobSlots = LUI.UITightText.new()
	paintjobSlots:setLeftRight( true, false, 13, 99 )
	paintjobSlots:setTopBottom( true, false, 5.25, 30.25 )
	paintjobSlots:setText( Engine.Localize( "MENU_PAINTJOB_SLOTS" ) )
	paintjobSlots:setTTF( "fonts/default.ttf" )
	self:addElement( paintjobSlots )
	self.paintjobSlots = paintjobSlots
	
	local used = LUI.UITightText.new()
	used:setLeftRight( true, false, 16, 90 )
	used:setTopBottom( true, false, 44.75, 69.75 )
	used:setRGB( 0, 0, 0 )
	used:setText( Engine.Localize( "MENU_USED" ) )
	used:setTTF( "fonts/default.ttf" )
	self:addElement( used )
	self.used = used
	
	local usedCountBg = LUI.UIImage.new()
	usedCountBg:setLeftRight( true, false, 87, 191 )
	usedCountBg:setTopBottom( true, false, 40.75, 73.25 )
	usedCountBg:setRGB( 0, 0, 0 )
	self:addElement( usedCountBg )
	self.usedCountBg = usedCountBg
	
	local slotFulltext = LUI.UIText.new()
	slotFulltext:setLeftRight( true, false, 237.02, 422.02 )
	slotFulltext:setTopBottom( true, false, 44.75, 69.75 )
	slotFulltext:setAlpha( 0 )
	slotFulltext:setText( Engine.Localize( "MENU_PAINTJOB_SOTS_FULL" ) )
	slotFulltext:setTTF( "fonts/default.ttf" )
	slotFulltext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	slotFulltext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( slotFulltext )
	self.slotFulltext = slotFulltext
	
	local slotfullWarningImage = LUI.UIImage.new()
	slotfullWarningImage:setLeftRight( true, false, 205.02, 237.02 )
	slotfullWarningImage:setTopBottom( true, false, 41.25, 73.25 )
	slotfullWarningImage:setRGB( 1, 0, 0 )
	slotfullWarningImage:setAlpha( 0 )
	slotfullWarningImage:setImage( RegisterImage( "uie_t7_icon_error_overlays" ) )
	self:addElement( slotfullWarningImage )
	self.slotfullWarningImage = slotfullWarningImage
	
	local count = LUI.UIText.new()
	count:setLeftRight( true, false, 104.5, 175.5 )
	count:setTopBottom( true, false, 44.75, 69.75 )
	count:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION" ) )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	count:subscribeToGlobalModel( controller, "PerController", "Paintshop.UpdateDataSource", function ( model )
		PaintjobSelector_UpdateSlotCount( self, count, controller )
	end )
	self:addElement( count )
	self.count = count
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				slotFulltext:completeAnimation()
				self.slotFulltext:setAlpha( 0 )
				self.clipFinished( slotFulltext, {} )
				slotfullWarningImage:completeAnimation()
				self.slotfullWarningImage:setAlpha( 0 )
				self.clipFinished( slotfullWarningImage, {} )
				count:completeAnimation()
				self.count:setRGB( 1, 1, 1 )
				self.clipFinished( count, {} )
			end
		},
		SlotsFull = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				slotFulltext:completeAnimation()
				self.slotFulltext:setRGB( 1, 0, 0 )
				self.slotFulltext:setAlpha( 1 )
				self.clipFinished( slotFulltext, {} )
				slotfullWarningImage:completeAnimation()
				self.slotfullWarningImage:setRGB( 1, 0, 0 )
				self.slotfullWarningImage:setAlpha( 1 )
				self.clipFinished( slotfullWarningImage, {} )
				count:completeAnimation()
				self.count:setRGB( 1, 0, 0 )
				self.clipFinished( count, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PaintjobSlotsBack0:close()
		element.count:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

