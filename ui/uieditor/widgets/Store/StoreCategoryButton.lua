-- 32dda5469605ba3657b92e686194d042
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )

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
	self:setLeftRight( true, false, 0, 230 )
	self:setTopBottom( true, false, 0, 65 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( true, true, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local Lbutton = CoD.BorderBakedSolid.new( menu, controller )
	Lbutton:setLeftRight( true, true, 0, 0 )
	Lbutton:setTopBottom( true, true, 0, 0 )
	Lbutton:setAlpha( 0 )
	self:addElement( Lbutton )
	self.Lbutton = Lbutton
	
	local FEFocusBarContainer0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarContainer0:setLeftRight( true, true, -1, 0 )
	FEFocusBarContainer0:setTopBottom( true, false, -3.97, 3.38 )
	FEFocusBarContainer0:setAlpha( 0 )
	self:addElement( FEFocusBarContainer0 )
	self.FEFocusBarContainer0 = FEFocusBarContainer0
	
	local itemImageBg = LUI.UIImage.new()
	itemImageBg:setLeftRight( true, false, 2, 67 )
	itemImageBg:setTopBottom( false, false, -29.81, 29.81 )
	itemImageBg:setRGB( 0.06, 0.08, 0.1 )
	itemImageBg:setAlpha( 0.35 )
	self:addElement( itemImageBg )
	self.itemImageBg = itemImageBg
	
	local itemName = CoD.cac_ListButtonLabel.new( menu, controller )
	itemName:setLeftRight( true, false, 78.5, 206.5 )
	itemName:setTopBottom( true, false, 23.83, 43.83 )
	itemName:linkToElementModel( self, "category_loc_ref", true, function ( model )
		local categoryLocRef = Engine.GetModelValue( model )
		if categoryLocRef then
			itemName.itemName:setText( Engine.Localize( categoryLocRef ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, false, 13.2, 54 )
	itemImage:setTopBottom( false, false, -19.32, 18.98 )
	itemImage:linkToElementModel( self, "imageName", true, function ( model )
		local imageName = Engine.GetModelValue( model )
		if imageName then
			itemImage:setImage( RegisterImage( imageName ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( true, false, 65, 69 )
	itemImageLine:setTopBottom( false, false, -30.5, 30.5 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -1, 0 )
	FocusBarB:setTopBottom( true, false, 63, 66 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				Lbutton:completeAnimation()
				self.Lbutton:setLeftRight( true, true, 0, 0 )
				self.Lbutton:setTopBottom( true, true, 0, 0 )
				self.Lbutton:setAlpha( 0 )
				self.clipFinished( Lbutton, {} )
				FEFocusBarContainer0:completeAnimation()
				self.FEFocusBarContainer0:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainer0, {} )
				itemImageBg:completeAnimation()
				self.itemImageBg:setZoom( 0 )
				self.clipFinished( itemImageBg, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 13.2, 54 )
				self.itemImage:setTopBottom( false, false, -19.32, 18.98 )
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setLeftRight( true, true, 0, 0 )
				self.BoxButtonLrgIdle:setTopBottom( true, true, 0, 0 )
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				local LbuttonFrame2 = function ( Lbutton, event )
					local LbuttonFrame3 = function ( Lbutton, event )
						local LbuttonFrame4 = function ( Lbutton, event )
							local LbuttonFrame5 = function ( Lbutton, event )
								local LbuttonFrame6 = function ( Lbutton, event )
									local LbuttonFrame7 = function ( Lbutton, event )
										if not event.interrupted then
											Lbutton:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										end
										Lbutton:setLeftRight( true, true, 0, 0 )
										Lbutton:setTopBottom( true, true, 0, 0 )
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
				self.Lbutton:setLeftRight( true, true, 0, 0 )
				self.Lbutton:setTopBottom( true, true, 0, 0 )
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
					itemImageBg:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImageBg, event )
					else
						itemImageBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImageBg:completeAnimation()
				self.itemImageBg:setAlpha( 1 )
				self.itemImageBg:setZoom( 0 )
				itemImageBgFrame2( itemImageBg, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 13.2, 54 )
				self.itemImage:setTopBottom( false, false, -19.32, 18.98 )
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
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
				self:setupElementClipCounter( 7 )
				Lbutton:completeAnimation()
				self.Lbutton:setAlpha( 1 )
				self.Lbutton:setZoom( 0 )
				self.clipFinished( Lbutton, {} )
				FEFocusBarContainer0:completeAnimation()
				self.FEFocusBarContainer0:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainer0, {} )
				itemImageBg:completeAnimation()
				self.itemImageBg:setZoom( 0 )
				self.clipFinished( itemImageBg, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 13.2, 54 )
				self.itemImage:setTopBottom( false, false, -19.32, 18.98 )
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				itemImageLine:completeAnimation()
				self.itemImageLine:setLeftRight( true, false, 65, 69 )
				self.itemImageLine:setTopBottom( false, false, -30.5, 30.5 )
				self.clipFinished( itemImageLine, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
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
					itemImageBg:setRGB( 0.06, 0.08, 0.1 )
					itemImageBg:setAlpha( 0.35 )
					itemImageBg:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemImageBg, event )
					else
						itemImageBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemImageBg:completeAnimation()
				self.itemImageBg:setRGB( 0.06, 0.08, 0.1 )
				self.itemImageBg:setAlpha( 0.35 )
				self.itemImageBg:setZoom( 0 )
				itemImageBgFrame2( itemImageBg, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 13.2, 54 )
				self.itemImage:setTopBottom( false, false, -19.32, 18.98 )
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
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
				self:setupElementClipCounter( 6 )
				Lbutton:completeAnimation()
				self.Lbutton:setAlpha( 0 )
				self.clipFinished( Lbutton, {} )
				FEFocusBarContainer0:completeAnimation()
				self.FEFocusBarContainer0:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainer0, {} )
				itemImageBg:completeAnimation()
				self.itemImageBg:setAlpha( 0.17 )
				self.clipFinished( itemImageBg, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0.25 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.2 )
				self.clipFinished( itemImage, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				Lbutton:completeAnimation()
				self.Lbutton:setLeftRight( true, true, 0, 0 )
				self.Lbutton:setTopBottom( true, true, 0, 0 )
				self.Lbutton:setAlpha( 1 )
				self.clipFinished( Lbutton, {} )
				FEFocusBarContainer0:completeAnimation()
				self.FEFocusBarContainer0:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainer0, {} )
				itemImageBg:completeAnimation()
				self.itemImageBg:setZoom( 0 )
				self.clipFinished( itemImageBg, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgIdle:close()
		element.Lbutton:close()
		element.FEFocusBarContainer0:close()
		element.itemName:close()
		element.FocusBarB:close()
		element.itemImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

