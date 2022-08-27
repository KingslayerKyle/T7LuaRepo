-- aace71242ff934f60df358c0c08a2ffd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherLineTop" )

CoD.SpikeLauncherLine = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.SpikeLauncherLine )
	self.id = "SpikeLauncherLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 163 )
	
	local TopLine = LUI.UIImage.new()
	TopLine:setLeftRight( true, true, 0, 0 )
	TopLine:setTopBottom( true, false, 0, 30 )
	TopLine:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_anchortop" ) )
	TopLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TopLine )
	self.TopLine = TopLine
	
	local MiddleLine = LUI.UIImage.new()
	MiddleLine:setLeftRight( true, true, 0, 0 )
	MiddleLine:setTopBottom( true, true, 30, -17 )
	MiddleLine:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_anchormiddle" ) )
	MiddleLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MiddleLine )
	self.MiddleLine = MiddleLine
	
	local BaseLine = LUI.UIImage.new()
	BaseLine:setLeftRight( true, true, 0, 0 )
	BaseLine:setTopBottom( false, true, -17, -0.33 )
	BaseLine:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_anchorbase" ) )
	BaseLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BaseLine )
	self.BaseLine = BaseLine
	
	local SpikeLauncherLineTop0 = CoD.SpikeLauncherLineTop.new( menu, controller )
	SpikeLauncherLineTop0:setLeftRight( true, true, 0, 0 )
	SpikeLauncherLineTop0:setTopBottom( true, false, 0, 17 )
	SpikeLauncherLineTop0:setAlpha( 0 )
	self:addElement( SpikeLauncherLineTop0 )
	self.SpikeLauncherLineTop0 = SpikeLauncherLineTop0
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, true, 25, -23 )
	Arrow:setTopBottom( true, false, 20.5, 27 )
	Arrow:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_anchorarrowanimate" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				TopLine:completeAnimation()
				self.TopLine:setAlpha( 1 )
				self.clipFinished( TopLine, {} )
				MiddleLine:completeAnimation()
				self.MiddleLine:setAlpha( 1 )
				self.clipFinished( MiddleLine, {} )
				BaseLine:completeAnimation()
				self.BaseLine:setAlpha( 1 )
				self.clipFinished( BaseLine, {} )
				SpikeLauncherLineTop0:completeAnimation()
				self.SpikeLauncherLineTop0:setAlpha( 0 )
				self.clipFinished( SpikeLauncherLineTop0, {} )
				local ArrowFrame2 = function ( Arrow, event )
					local ArrowFrame3 = function ( Arrow, event )
						local ArrowFrame4 = function ( Arrow, event )
							if not event.interrupted then
								Arrow:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
							end
							Arrow:setLeftRight( true, true, 24, -24 )
							Arrow:setTopBottom( true, false, 350.5, 357 )
							Arrow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Arrow, event )
							else
								Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ArrowFrame4( Arrow, event )
							return 
						else
							Arrow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Arrow:setAlpha( 0 )
							Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowFrame3( Arrow, event )
						return 
					else
						Arrow:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						Arrow:setLeftRight( true, true, 24, -24 )
						Arrow:setTopBottom( true, false, 350.5, 357 )
						Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame3 )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, true, 25, -23 )
				self.Arrow:setTopBottom( true, false, 20.5, 27 )
				self.Arrow:setAlpha( 1 )
				ArrowFrame2( Arrow, {} )
			end
		},
		NoLine = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				TopLine:completeAnimation()
				self.TopLine:setAlpha( 0 )
				self.clipFinished( TopLine, {} )
				MiddleLine:completeAnimation()
				self.MiddleLine:setAlpha( 0 )
				self.clipFinished( MiddleLine, {} )
				BaseLine:completeAnimation()
				self.BaseLine:setAlpha( 0 )
				self.clipFinished( BaseLine, {} )
				SpikeLauncherLineTop0:completeAnimation()
				self.SpikeLauncherLineTop0:setAlpha( 1 )
				self.clipFinished( SpikeLauncherLineTop0, {} )
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SpikeLauncherLineTop0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

