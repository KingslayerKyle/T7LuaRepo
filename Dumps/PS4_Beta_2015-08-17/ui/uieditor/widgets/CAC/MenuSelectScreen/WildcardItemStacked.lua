require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.WildcardItemStacked = InheritFrom( LUI.UIElement )
CoD.WildcardItemStacked.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.WildcardItemStacked )
	self.id = "WildcardItemStacked"
	self.soundSet = "CAC_Wildcard"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 168 )
	self.anyChildUsesUpdateState = true
	
	local bk2 = LUI.UIImage.new()
	bk2:setLeftRight( true, false, 8.54, 108 )
	bk2:setTopBottom( true, false, 5, 144 )
	bk2:setRGB( 0, 0, 0 )
	bk2:setAlpha( 0.9 )
	self:addElement( bk2 )
	self.bk2 = bk2
	
	local bg2 = LUI.UIImage.new()
	bg2:setLeftRight( false, false, -57, 63 )
	bg2:setTopBottom( true, false, 6, 134 )
	bg2:setRGB( 0.39, 0.39, 0.39 )
	bg2:setImage( RegisterImage( "uie_t7_hud_cac_wildcards_primarygunfighter_256" ) )
	self:addElement( bg2 )
	self.bg2 = bg2
	
	local equippedIcon2 = LUI.UIImage.new()
	equippedIcon2:setLeftRight( false, true, -28, -14 )
	equippedIcon2:setTopBottom( true, false, 8, 22 )
	equippedIcon2:setRGB( 0.55, 0.77, 0.25 )
	equippedIcon2:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon2 )
	self.equippedIcon2 = equippedIcon2
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, false, 6, 110 )
	StartMenuframenoBG00:setTopBottom( true, false, 4, 145 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local bk1 = LUI.UIImage.new()
	bk1:setLeftRight( true, false, 13.54, 113 )
	bk1:setTopBottom( true, false, 24, 163 )
	bk1:setRGB( 0, 0, 0 )
	bk1:setAlpha( 0.9 )
	self:addElement( bk1 )
	self.bk1 = bk1
	
	local bg1 = LUI.UIImage.new()
	bg1:setLeftRight( true, true, -4, 26 )
	bg1:setTopBottom( true, false, 26, 158 )
	bg1:setRGB( 0.39, 0.39, 0.39 )
	bg1:setImage( RegisterImage( "uie_t7_hud_cac_wildcards_primarygunfighter_256" ) )
	self:addElement( bg1 )
	self.bg1 = bg1
	
	local equippedIcon1 = LUI.UIImage.new()
	equippedIcon1:setLeftRight( false, true, -23, -9 )
	equippedIcon1:setTopBottom( true, false, 27, 41 )
	equippedIcon1:setRGB( 0.55, 0.77, 0.25 )
	equippedIcon1:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon1 )
	self.equippedIcon1 = equippedIcon1
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, false, 11, 115 )
	StartMenuframenoBG0:setTopBottom( true, false, 23, 164 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				bk2:completeAnimation()
				self.bk2:setAlpha( 0 )
				self.clipFinished( bk2, {} )
				bg2:completeAnimation()
				self.bg2:setAlpha( 0 )
				self.clipFinished( bg2, {} )
				equippedIcon2:completeAnimation()
				self.equippedIcon2:setAlpha( 0 )
				self.clipFinished( equippedIcon2, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG00, {} )
				bk1:completeAnimation()
				self.bk1:setAlpha( 0 )
				self.clipFinished( bk1, {} )
				bg1:completeAnimation()
				self.bg1:setAlpha( 0 )
				self.clipFinished( bg1, {} )
				equippedIcon1:completeAnimation()
				self.equippedIcon1:setAlpha( 0 )
				self.clipFinished( equippedIcon1, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		},
		Equipped0 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				bk2:completeAnimation()
				self.bk2:setAlpha( 0 )
				self.clipFinished( bk2, {} )
				bg2:completeAnimation()
				self.bg2:setLeftRight( false, false, -60, 60 )
				self.bg2:setTopBottom( true, false, 8, 136 )
				self.bg2:setAlpha( 0 )
				self.clipFinished( bg2, {} )
				equippedIcon2:completeAnimation()
				self.equippedIcon2:setLeftRight( false, true, -26, -12 )
				self.equippedIcon2:setTopBottom( true, false, 14, 28 )
				self.equippedIcon2:setAlpha( 0 )
				self.clipFinished( equippedIcon2, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG00, {} )
				bk1:completeAnimation()
				self.bk1:setAlpha( 0 )
				self.clipFinished( bk1, {} )
				bg1:completeAnimation()
				self.bg1:setLeftRight( true, true, 96, 126 )
				self.bg1:setTopBottom( true, false, 31, 163 )
				self.bg1:setAlpha( 0 )
				self.clipFinished( bg1, {} )
				equippedIcon1:completeAnimation()
				self.equippedIcon1:setLeftRight( false, true, -22, -8 )
				self.equippedIcon1:setTopBottom( true, false, 27, 41 )
				self.equippedIcon1:setAlpha( 0 )
				self.clipFinished( equippedIcon1, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		},
		Equipped1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				bg2:completeAnimation()
				self.bg2:setLeftRight( false, false, -60, 60 )
				self.bg2:setTopBottom( true, false, 4, 132 )
				self.bg2:setAlpha( 1 )
				self.clipFinished( bg2, {} )
				equippedIcon2:completeAnimation()
				self.equippedIcon2:setLeftRight( false, true, -26, -12 )
				self.equippedIcon2:setTopBottom( true, false, 10, 24 )
				self.equippedIcon2:setAlpha( 1 )
				self.clipFinished( equippedIcon2, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
				bk1:completeAnimation()
				self.bk1:setAlpha( 0 )
				self.clipFinished( bk1, {} )
				bg1:completeAnimation()
				self.bg1:setLeftRight( true, true, -15, 15 )
				self.bg1:setTopBottom( true, false, 19, 151 )
				self.bg1:setAlpha( 0 )
				self.clipFinished( bg1, {} )
				equippedIcon1:completeAnimation()
				self.equippedIcon1:setLeftRight( false, true, -22, -8 )
				self.equippedIcon1:setTopBottom( true, false, 27, 41 )
				self.equippedIcon1:setAlpha( 0 )
				self.clipFinished( equippedIcon1, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		},
		Equipped2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				bk2:completeAnimation()
				self.bk2:setAlpha( 1 )
				self.clipFinished( bk2, {} )
				bg2:completeAnimation()
				self.bg2:setAlpha( 1 )
				self.clipFinished( bg2, {} )
				equippedIcon2:completeAnimation()
				self.equippedIcon2:setAlpha( 1 )
				self.clipFinished( equippedIcon2, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
				bk1:completeAnimation()
				self.bk1:setAlpha( 1 )
				self.clipFinished( bk1, {} )
				bg1:completeAnimation()
				self.bg1:setAlpha( 1 )
				self.clipFinished( bg1, {} )
				equippedIcon1:completeAnimation()
				self.equippedIcon1:setAlpha( 1 )
				self.clipFinished( equippedIcon1, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		},
		Equipped3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				bk2:completeAnimation()
				self.bk2:setAlpha( 1 )
				self.clipFinished( bk2, {} )
				bg2:completeAnimation()
				self.bg2:setAlpha( 1 )
				self.clipFinished( bg2, {} )
				equippedIcon2:completeAnimation()
				self.equippedIcon2:setAlpha( 1 )
				self.clipFinished( equippedIcon2, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
				bg1:completeAnimation()
				self.bg1:setAlpha( 1 )
				self.clipFinished( bg1, {} )
				equippedIcon1:completeAnimation()
				self.equippedIcon1:setAlpha( 1 )
				self.clipFinished( equippedIcon1, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Equipped0",
			condition = function ( menu, element, event )
				return IsCACSlotSpecificItemEquipped( element, controller, "bonuscard_primary_gunfighter" ) and IsCACEquippedWildcardItemCount( menu, "bonuscard_primary_gunfighter", 0 )
			end
		},
		{
			stateName = "Equipped1",
			condition = function ( menu, element, event )
				return IsCACSlotSpecificItemEquipped( element, controller, "bonuscard_primary_gunfighter" ) and IsCACEquippedWildcardItemCount( menu, "bonuscard_primary_gunfighter", 1 )
			end
		},
		{
			stateName = "Equipped2",
			condition = function ( menu, element, event )
				return IsCACSlotSpecificItemEquipped( element, controller, "bonuscard_primary_gunfighter" ) and IsCACEquippedWildcardItemCount( menu, "bonuscard_primary_gunfighter", 2 )
			end
		},
		{
			stateName = "Equipped3",
			condition = function ( menu, element, event )
				return IsCACSlotSpecificItemEquipped( element, controller, "bonuscard_primary_gunfighter" ) and IsCACEquippedWildcardItemCount( menu, "bonuscard_primary_gunfighter", 3 )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG00:close()
		self.StartMenuframenoBG0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

