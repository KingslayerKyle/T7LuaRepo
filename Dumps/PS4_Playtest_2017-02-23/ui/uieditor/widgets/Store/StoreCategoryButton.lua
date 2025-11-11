require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.StoreCategoryButton = InheritFrom( LUI.UIElement )
CoD.StoreCategoryButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StoreCategoryButton )
	self.id = "StoreCategoryButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 345 )
	self:setTopBottom( 0, 0, 0, 97 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local Lbutton = CoD.BorderBakedSolid.new( menu, controller )
	Lbutton:setLeftRight( 0, 1, 0, 0 )
	Lbutton:setTopBottom( 0, 1, 0, 0 )
	Lbutton:setAlpha( 0 )
	self:addElement( Lbutton )
	self.Lbutton = Lbutton
	
	local Lblur = CoD.BorderBakedBlur.new( menu, controller )
	Lblur:setLeftRight( 0, 1, 0, -4 )
	Lblur:setTopBottom( 0, 1, 0, 0 )
	Lblur:setAlpha( 0.05 )
	self:addElement( Lblur )
	self.Lblur = Lblur
	
	local FEFocusBarContainer0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarContainer0:setLeftRight( 0, 1, -2, 0 )
	FEFocusBarContainer0:setTopBottom( 0, 0, -6, 5 )
	FEFocusBarContainer0:setAlpha( 0 )
	self:addElement( FEFocusBarContainer0 )
	self.FEFocusBarContainer0 = FEFocusBarContainer0
	
	local itemImageBg = LUI.UIImage.new()
	itemImageBg:setLeftRight( 0, 0, 3, 101 )
	itemImageBg:setTopBottom( 0.5, 0.5, -44.5, 44.5 )
	itemImageBg:setRGB( 0.06, 0.08, 0.1 )
	itemImageBg:setAlpha( 0.35 )
	self:addElement( itemImageBg )
	self.itemImageBg = itemImageBg
	
	local itemName = CoD.cac_ListButtonLabel.new( menu, controller )
	itemName:setLeftRight( 0, 0, 118, 310 )
	itemName:setTopBottom( 0, 0, 36, 66 )
	itemName:linkToElementModel( self, "category_loc_ref", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( 0, 0, 20, 81 )
	itemImage:setTopBottom( 0.5, 0.5, -29, 28 )
	itemImage:linkToElementModel( self, "imageName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( 0, 0, 97, 103 )
	itemImageLine:setTopBottom( 0.5, 0.5, -46, 46 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -2, 0 )
	FocusBarB:setTopBottom( 0, 0, 95, 99 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.resetProperties = function ()
		BoxButtonLrgInactive:completeAnimation()
		itemImageBg:completeAnimation()
		FocusBarB:completeAnimation()
		FEFocusBarContainer0:completeAnimation()
		Lbutton:completeAnimation()
		itemImageLine:completeAnimation()
		Lblur:completeAnimation()
		itemImage:completeAnimation()
		itemName:completeAnimation()
		BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
		BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
		itemImageBg:setAlpha( 0.35 )
		itemImageBg:setZoom( 0 )
		FocusBarB:setAlpha( 0 )
		FEFocusBarContainer0:setAlpha( 0 )
		Lbutton:setAlpha( 0 )
		Lbutton:setZoom( 0 )
		itemImageLine:setLeftRight( 0, 0, 97, 103 )
		itemImageLine:setTopBottom( 0.5, 0.5, -46, 46 )
		Lblur:setLeftRight( 0, 1, 0, -4 )
		Lblur:setTopBottom( 0, 1, 0, 0 )
		itemImage:setAlpha( 1 )
		itemName:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setLeftRight( 0, 1, -4, 0 )
				self.BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
				self.clipFinished( BoxButtonLrgInactive, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LbuttonFrame2 = function ( Lbutton, event )
					local LbuttonFrame3 = function ( Lbutton, event )
						local LbuttonFrame4 = function ( Lbutton, event )
							local LbuttonFrame5 = function ( Lbutton, event )
								local LbuttonFrame6 = function ( Lbutton, event )
									local LbuttonFrame7 = function ( Lbutton, event )
										if not event.interrupted then
											Lbutton:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										end
										Lbutton:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( Lbutton, event )
										else
											Lbutton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										LbuttonFrame7( Lbutton, event )
										return 
									else
										Lbutton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Lbutton:setAlpha( 1 )
										Lbutton:registerEventHandler( "transition_complete_keyframe", LbuttonFrame7 )
									end
								end
								
								if event.interrupted then
									LbuttonFrame6( Lbutton, event )
									return 
								else
									Lbutton:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Lbutton:setAlpha( 0 )
									Lbutton:registerEventHandler( "transition_complete_keyframe", LbuttonFrame6 )
								end
							end
							
							if event.interrupted then
								LbuttonFrame5( Lbutton, event )
								return 
							else
								Lbutton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Lbutton:setAlpha( 0.5 )
								Lbutton:registerEventHandler( "transition_complete_keyframe", LbuttonFrame5 )
							end
						end
						
						if event.interrupted then
							LbuttonFrame4( Lbutton, event )
							return 
						else
							Lbutton:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Lbutton:setAlpha( 1 )
							Lbutton:registerEventHandler( "transition_complete_keyframe", LbuttonFrame4 )
						end
					end
					
					if event.interrupted then
						LbuttonFrame3( Lbutton, event )
						return 
					else
						Lbutton:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Lbutton:registerEventHandler( "transition_complete_keyframe", LbuttonFrame3 )
					end
				end
				
				Lbutton:completeAnimation()
				self.Lbutton:setAlpha( 0 )
				LbuttonFrame2( Lbutton, {} )
				local FEFocusBarContainer0Frame2 = function ( FEFocusBarContainer0, event )
					local FEFocusBarContainer0Frame3 = function ( FEFocusBarContainer0, event )
						local FEFocusBarContainer0Frame4 = function ( FEFocusBarContainer0, event )
							local FEFocusBarContainer0Frame5 = function ( FEFocusBarContainer0, event )
								local FEFocusBarContainer0Frame6 = function ( FEFocusBarContainer0, event )
									local FEFocusBarContainer0Frame7 = function ( FEFocusBarContainer0, event )
										if not event.interrupted then
											FEFocusBarContainer0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FEFocusBarContainer0:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FEFocusBarContainer0, event )
										else
											FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FEFocusBarContainer0Frame7( FEFocusBarContainer0, event )
										return 
									else
										FEFocusBarContainer0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", FEFocusBarContainer0Frame7 )
									end
								end
								
								if event.interrupted then
									FEFocusBarContainer0Frame6( FEFocusBarContainer0, event )
									return 
								else
									FEFocusBarContainer0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									FEFocusBarContainer0:setAlpha( 0.35 )
									FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", FEFocusBarContainer0Frame6 )
								end
							end
							
							if event.interrupted then
								FEFocusBarContainer0Frame5( FEFocusBarContainer0, event )
								return 
							else
								FEFocusBarContainer0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FEFocusBarContainer0:setAlpha( 0.55 )
								FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", FEFocusBarContainer0Frame5 )
							end
						end
						
						if event.interrupted then
							FEFocusBarContainer0Frame4( FEFocusBarContainer0, event )
							return 
						else
							FEFocusBarContainer0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FEFocusBarContainer0:setAlpha( 0.56 )
							FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", FEFocusBarContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						FEFocusBarContainer0Frame3( FEFocusBarContainer0, event )
						return 
					else
						FEFocusBarContainer0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", FEFocusBarContainer0Frame3 )
					end
				end
				
				FEFocusBarContainer0:completeAnimation()
				self.FEFocusBarContainer0:setAlpha( 0 )
				FEFocusBarContainer0Frame2( FEFocusBarContainer0, {} )
				local itemImageBgFrame2 = function ( itemImageBg, event )
					if not event.interrupted then
						itemImageBg:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					itemImageBg:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( itemImageBg, event )
					else
						itemImageBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImageBg:completeAnimation()
				self.itemImageBg:setAlpha( 1 )
				itemImageBgFrame2( itemImageBg, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								if not event.interrupted then
									FocusBarB:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								end
								FocusBarB:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( FocusBarB, event )
								else
									FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.35 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.56 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				self.nextClip = "GainFocus"
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Lbutton:completeAnimation()
				self.Lbutton:setAlpha( 1 )
				self.clipFinished( Lbutton, {} )
				FEFocusBarContainer0:completeAnimation()
				self.FEFocusBarContainer0:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainer0, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setLeftRight( 0, 0, 98, 104 )
				self.itemImageLine:setTopBottom( 0.5, 0.5, -46, 46 )
				self.clipFinished( itemImageLine, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LbuttonFrame2 = function ( Lbutton, event )
					if not event.interrupted then
						Lbutton:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Back )
					end
					Lbutton:setAlpha( 0 )
					Lbutton:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( Lbutton, event )
					else
						Lbutton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lbutton:completeAnimation()
				self.Lbutton:setAlpha( 1 )
				self.Lbutton:setZoom( 0 )
				LbuttonFrame2( Lbutton, {} )
				local LblurFrame2 = function ( Lblur, event )
					if not event.interrupted then
						Lblur:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Lblur:setLeftRight( 0, 1, 0, -116 )
					Lblur:setTopBottom( 0, 1, 0, 0 )
					if event.interrupted then
						self.clipFinished( Lblur, event )
					else
						Lblur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lblur:completeAnimation()
				self.Lblur:setLeftRight( 0, 1, 0, 0 )
				self.Lblur:setTopBottom( 0, 1, 0, 0 )
				LblurFrame2( Lblur, {} )
				local FEFocusBarContainer0Frame2 = function ( FEFocusBarContainer0, event )
					if not event.interrupted then
						FEFocusBarContainer0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					FEFocusBarContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEFocusBarContainer0, event )
					else
						FEFocusBarContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEFocusBarContainer0:completeAnimation()
				self.FEFocusBarContainer0:setAlpha( 1 )
				FEFocusBarContainer0Frame2( FEFocusBarContainer0, {} )
				local itemImageBgFrame2 = function ( itemImageBg, event )
					if not event.interrupted then
						itemImageBg:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Back )
					end
					itemImageBg:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImageBg, event )
					else
						itemImageBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImageBg:completeAnimation()
				self.itemImageBg:setZoom( 0 )
				itemImageBgFrame2( itemImageBg, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
			end
		},
		NoListFocus = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				itemImageBg:completeAnimation()
				self.itemImageBg:setAlpha( 0.17 )
				self.clipFinished( itemImageBg, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0.25 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.2 )
				self.clipFinished( itemImage, {} )
			end,
			Active = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setLeftRight( 0, 1, -4, 0 )
				self.BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				Lbutton:completeAnimation()
				self.Lbutton:setAlpha( 1 )
				self.clipFinished( Lbutton, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgIdle:close()
		self.Lbutton:close()
		self.Lblur:close()
		self.FEFocusBarContainer0:close()
		self.itemName:close()
		self.FocusBarB:close()
		self.itemImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

