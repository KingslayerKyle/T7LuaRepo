-- 445f3e99f7ac7b95d3577c7d748ce4e1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_MeterKaratInner" )

CoD.ScrStk_MeterKarat = InheritFrom( LUI.UIElement )
CoD.ScrStk_MeterKarat.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_MeterKarat )
	self.id = "ScrStk_MeterKarat"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 8 )
	self:setTopBottom( true, false, 0, 8 )
	self.anyChildUsesUpdateState = true
	
	local FocusMeterFillWhite0 = LUI.UIImage.new()
	FocusMeterFillWhite0:setLeftRight( false, false, -4, 4 )
	FocusMeterFillWhite0:setTopBottom( false, false, -2, 2 )
	FocusMeterFillWhite0:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_focusmeterbit" ) )
	self:addElement( FocusMeterFillWhite0 )
	self.FocusMeterFillWhite0 = FocusMeterFillWhite0
	
	local ScrStkMeterKaratInner0 = CoD.ScrStk_MeterKaratInner.new( menu, controller )
	ScrStkMeterKaratInner0:setLeftRight( false, false, -5.4, 6.6 )
	ScrStkMeterKaratInner0:setTopBottom( false, false, -12.5, 14.5 )
	ScrStkMeterKaratInner0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ScrStkMeterKaratInner0 )
	self.ScrStkMeterKaratInner0 = ScrStkMeterKaratInner0
	
	local ScrStkMeterKaratInner00 = CoD.ScrStk_MeterKaratInner.new( menu, controller )
	ScrStkMeterKaratInner00:setLeftRight( false, false, -5.4, 6.6 )
	ScrStkMeterKaratInner00:setTopBottom( false, false, -13.5, 13.5 )
	ScrStkMeterKaratInner00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ScrStkMeterKaratInner00 )
	self.ScrStkMeterKaratInner00 = ScrStkMeterKaratInner00
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -11.4, 12.6 )
	Image0:setTopBottom( false, false, -2, 2 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end,
			ScoreAdded = function ()
				self:setupElementClipCounter( 1 )

				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								if not event.interrupted then
									Image0:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Bounce )
								end
								Image0:setLeftRight( false, false, -63.4, 68.6 )
								Image0:setTopBottom( false, false, -2, 2 )
								Image0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image0, event )
								else
									Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								Image0:setLeftRight( false, false, -57.8, 59.31 )
								Image0:setTopBottom( false, false, -3.42, 3.42 )
								Image0:setAlpha( 1 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Image0:setLeftRight( false, false, -56.62, 57.37 )
							Image0:setTopBottom( false, false, -3.72, 3.72 )
							Image0:setAlpha( 0.49 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Image0:setLeftRight( false, false, -55.71, 55.84 )
						Image0:setTopBottom( false, false, -3.95, 3.95 )
						Image0:setAlpha( 1 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -55.5, 55.5 )
				self.Image0:setTopBottom( false, false, -4, 4 )
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScrStkMeterKaratInner0:close()
		element.ScrStkMeterKaratInner00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
