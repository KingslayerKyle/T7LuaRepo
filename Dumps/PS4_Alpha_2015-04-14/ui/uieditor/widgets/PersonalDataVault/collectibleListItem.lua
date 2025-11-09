require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.BorderFocusHeader" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingFooter" )

CoD.collectibleListItem = InheritFrom( LUI.UIElement )
CoD.collectibleListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.collectibleListItem )
	self.id = "collectibleListItem"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 150 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( menu, controller )
	BorderBakedBlur0:setLeftRight( true, true, 0, 0 )
	BorderBakedBlur0:setTopBottom( true, true, 0, 0 )
	BorderBakedBlur0:setRGB( 1, 1, 1 )
	BorderBakedBlur0:setAlpha( 0.4 )
	BorderBakedBlur0:setZoom( -100 )
	self:addElement( BorderBakedBlur0 )
	self.BorderBakedBlur0 = BorderBakedBlur0
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, 0, 0 )
	BorderBakedMask0:setTopBottom( true, true, 0, 0 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0.3 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
	BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
	BorderBakedSolid0:setRGB( 1, 1, 1 )
	BorderBakedSolid0:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BorderBaked0 = CoD.BorderBaked.new( menu, controller )
	BorderBaked0:setLeftRight( true, true, 0, 0 )
	BorderBaked0:setTopBottom( true, true, 0, 0 )
	BorderBaked0:setRGB( 1, 1, 1 )
	BorderBaked0:setAlpha( 0 )
	self:addElement( BorderBaked0 )
	self.BorderBaked0 = BorderBaked0
	
	local BorderFocusHeader0 = CoD.BorderFocusHeader.new( menu, controller )
	BorderFocusHeader0:setLeftRight( false, false, -18.62, 18.88 )
	BorderFocusHeader0:setTopBottom( true, false, -2.5, 2.5 )
	BorderFocusHeader0:setRGB( 0.18, 0.24, 0.33 )
	self:addElement( BorderFocusHeader0 )
	self.BorderFocusHeader0 = BorderFocusHeader0
	
	local itemName = LUI.UITightText.new()
	itemName:setLeftRight( false, false, -38, 38 )
	itemName:setTopBottom( false, true, -18.5, -2.5 )
	itemName:setRGB( 1, 1, 1 )
	itemName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( itemName )
	self.itemName = itemName
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( false, false, -48, 48 )
	itemImage:setTopBottom( false, false, -52, 44 )
	itemImage:setRGB( 1, 1, 1 )
	itemImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local LobbyMemberBackingFooter0 = CoD.LobbyMemberBackingFooter.new( menu, controller )
	LobbyMemberBackingFooter0:setLeftRight( true, true, -2, 1 )
	LobbyMemberBackingFooter0:setTopBottom( false, true, -2, 2 )
	LobbyMemberBackingFooter0:setRGB( 1, 1, 1 )
	LobbyMemberBackingFooter0:setAlpha( 0 )
	self:addElement( LobbyMemberBackingFooter0 )
	self.LobbyMemberBackingFooter0 = LobbyMemberBackingFooter0
	
	self.itemName:linkToElementModel( self, "shortName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setAlpha( 0.4 )
				self.clipFinished( BorderBakedBlur0, {} )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.3 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				BorderFocusHeader0:completeAnimation()
				self.BorderFocusHeader0:setLeftRight( false, false, -18.75, 18.75 )
				self.BorderFocusHeader0:setTopBottom( true, false, -1.5, 3.5 )
				self.BorderFocusHeader0:setRGB( 0.18, 0.24, 0.33 )
				self.BorderFocusHeader0:setZoom( 0 )
				self.clipFinished( BorderFocusHeader0, {} )
				itemName:completeAnimation()
				self.itemName:setZoom( 0 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setZoom( 0 )
				self.clipFinished( itemImage, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setAlpha( 0 )
				self.clipFinished( BorderBakedBlur0, {} )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 1 )
				self.BorderBakedMask0:setZoom( 50 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.BorderBakedSolid0:setZoom( 50 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 50 )
				self.clipFinished( BorderBaked0, {} )
				BorderFocusHeader0:completeAnimation()
				self.BorderFocusHeader0:setLeftRight( false, false, -18.75, 18.75 )
				self.BorderFocusHeader0:setTopBottom( true, false, -7.5, -2.5 )
				self.BorderFocusHeader0:setRGB( 0.93, 0.45, 0.05 )
				self.BorderFocusHeader0:setZoom( 50 )
				self.clipFinished( BorderFocusHeader0, {} )
				itemName:completeAnimation()
				self.itemName:setZoom( 50 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setZoom( 50 )
				self.clipFinished( itemImage, {} )
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setZoom( 50 )
				self.clipFinished( LobbyMemberBackingFooter0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 8 )
				local BorderBakedBlur0Frame2 = function ( BorderBakedBlur0, event )
					if not event.interrupted then
						BorderBakedBlur0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedBlur0:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( BorderBakedBlur0, event )
					else
						BorderBakedBlur0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setAlpha( 0 )
				BorderBakedBlur0Frame2( BorderBakedBlur0, {} )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedMask0:setAlpha( 0.3 )
					BorderBakedMask0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 1 )
				self.BorderBakedMask0:setZoom( 50 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setAlpha( 0.5 )
					BorderBakedSolid0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 1 )
				self.BorderBakedSolid0:setZoom( 50 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderBaked0:setAlpha( 0 )
					BorderBaked0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 50 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local BorderFocusHeader0Frame2 = function ( BorderFocusHeader0, event )
					if not event.interrupted then
						BorderFocusHeader0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					BorderFocusHeader0:setLeftRight( false, false, -18.75, 18.75 )
					BorderFocusHeader0:setTopBottom( true, false, -1.5, 3.5 )
					BorderFocusHeader0:setRGB( 0.18, 0.24, 0.33 )
					BorderFocusHeader0:setAlpha( 1 )
					BorderFocusHeader0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( BorderFocusHeader0, event )
					else
						BorderFocusHeader0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderFocusHeader0:completeAnimation()
				self.BorderFocusHeader0:setLeftRight( false, false, -18.75, 18.75 )
				self.BorderFocusHeader0:setTopBottom( true, false, -7.5, -2.5 )
				self.BorderFocusHeader0:setRGB( 0.93, 0.45, 0.05 )
				self.BorderFocusHeader0:setAlpha( 1 )
				self.BorderFocusHeader0:setZoom( 50 )
				BorderFocusHeader0Frame2( BorderFocusHeader0, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemName:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				self.itemName:setZoom( 50 )
				itemNameFrame2( itemName, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					itemImage:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setZoom( 50 )
				itemImageFrame2( itemImage, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					LobbyMemberBackingFooter0:setAlpha( 0 )
					LobbyMemberBackingFooter0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 1 )
				self.LobbyMemberBackingFooter0:setZoom( 50 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 8 )
				local BorderBakedBlur0Frame2 = function ( BorderBakedBlur0, event )
					if not event.interrupted then
						BorderBakedBlur0:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					BorderBakedBlur0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BorderBakedBlur0, event )
					else
						BorderBakedBlur0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setAlpha( 0.4 )
				BorderBakedBlur0Frame2( BorderBakedBlur0, {} )
				local BorderBakedMask0Frame2 = function ( BorderBakedMask0, event )
					if not event.interrupted then
						BorderBakedMask0:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					BorderBakedMask0:setAlpha( 1 )
					BorderBakedMask0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedMask0, event )
					else
						BorderBakedMask0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.3 )
				self.BorderBakedMask0:setZoom( 0 )
				BorderBakedMask0Frame2( BorderBakedMask0, {} )
				local BorderBakedSolid0Frame2 = function ( BorderBakedSolid0, event )
					if not event.interrupted then
						BorderBakedSolid0:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					BorderBakedSolid0:setAlpha( 1 )
					BorderBakedSolid0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBakedSolid0, event )
					else
						BorderBakedSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.BorderBakedSolid0:setZoom( 0 )
				BorderBakedSolid0Frame2( BorderBakedSolid0, {} )
				local BorderBaked0Frame2 = function ( BorderBaked0, event )
					if not event.interrupted then
						BorderBaked0:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					BorderBaked0:setAlpha( 0 )
					BorderBaked0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderBaked0, event )
					else
						BorderBaked0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				BorderBaked0Frame2( BorderBaked0, {} )
				local BorderFocusHeader0Frame2 = function ( BorderFocusHeader0, event )
					if not event.interrupted then
						BorderFocusHeader0:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					BorderFocusHeader0:setLeftRight( false, false, -18.75, 18.75 )
					BorderFocusHeader0:setTopBottom( true, false, -7.5, -2.5 )
					BorderFocusHeader0:setRGB( 0.93, 0.45, 0.05 )
					BorderFocusHeader0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( BorderFocusHeader0, event )
					else
						BorderFocusHeader0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BorderFocusHeader0:completeAnimation()
				self.BorderFocusHeader0:setLeftRight( false, false, -18.75, 18.75 )
				self.BorderFocusHeader0:setTopBottom( true, false, -1.5, 3.5 )
				self.BorderFocusHeader0:setRGB( 0.18, 0.24, 0.33 )
				self.BorderFocusHeader0:setZoom( 0 )
				BorderFocusHeader0Frame2( BorderFocusHeader0, {} )
				local itemNameFrame2 = function ( itemName, event )
					if not event.interrupted then
						itemName:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					itemName:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemName, event )
					else
						itemName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemName:completeAnimation()
				self.itemName:setZoom( 0 )
				itemNameFrame2( itemName, {} )
				local itemImageFrame2 = function ( itemImage, event )
					if not event.interrupted then
						itemImage:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					itemImage:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( itemImage, event )
					else
						itemImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImage:completeAnimation()
				self.itemImage:setZoom( 0 )
				itemImageFrame2( itemImage, {} )
				local LobbyMemberBackingFooter0Frame2 = function ( LobbyMemberBackingFooter0, event )
					if not event.interrupted then
						LobbyMemberBackingFooter0:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Back )
					end
					LobbyMemberBackingFooter0:setAlpha( 1 )
					LobbyMemberBackingFooter0:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( LobbyMemberBackingFooter0, event )
					else
						LobbyMemberBackingFooter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyMemberBackingFooter0:completeAnimation()
				self.LobbyMemberBackingFooter0:setAlpha( 0 )
				self.LobbyMemberBackingFooter0:setZoom( 0 )
				LobbyMemberBackingFooter0Frame2( LobbyMemberBackingFooter0, {} )
			end
		}
	}
	self.close = function ( self )
		self.BorderBakedBlur0:close()
		self.BorderBakedMask0:close()
		self.BorderBakedSolid0:close()
		self.BorderBaked0:close()
		self.BorderFocusHeader0:close()
		self.LobbyMemberBackingFooter0:close()
		self.itemName:close()
		self.itemImage:close()
		CoD.collectibleListItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

