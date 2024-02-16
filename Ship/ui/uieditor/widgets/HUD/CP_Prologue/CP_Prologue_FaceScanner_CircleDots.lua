-- da636ac3d1e98037d3799d28651914b7
-- This hash is used for caching, delete to decompile the file again

CoD.CP_Prologue_FaceScanner_CircleDots = InheritFrom( LUI.UIElement )
CoD.CP_Prologue_FaceScanner_CircleDots.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CP_Prologue_FaceScanner_CircleDots )
	self.id = "CP_Prologue_FaceScanner_CircleDots"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 205 )
	self:setTopBottom( true, false, 0, 205 )
	
	local CenterCircleDots = LUI.UIImage.new()
	CenterCircleDots:setLeftRight( false, false, -102.69, 102.69 )
	CenterCircleDots:setTopBottom( false, false, -102.69, 102.69 )
	CenterCircleDots:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgbcentercircledots" ) )
	CenterCircleDots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterCircleDots )
	self.CenterCircleDots = CenterCircleDots
	
	local CenterCircleDots0 = LUI.UIImage.new()
	CenterCircleDots0:setLeftRight( false, false, -102.69, 102.69 )
	CenterCircleDots0:setTopBottom( false, false, -102.69, 102.69 )
	CenterCircleDots0:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgbcentercircledots" ) )
	CenterCircleDots0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterCircleDots0 )
	self.CenterCircleDots0 = CenterCircleDots0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local CenterCircleDotsFrame2 = function ( CenterCircleDots, event )
					local CenterCircleDotsFrame3 = function ( CenterCircleDots, event )
						local CenterCircleDotsFrame4 = function ( CenterCircleDots, event )
							local CenterCircleDotsFrame5 = function ( CenterCircleDots, event )
								if not event.interrupted then
									CenterCircleDots:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
								end
								CenterCircleDots:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CenterCircleDots, event )
								else
									CenterCircleDots:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CenterCircleDotsFrame5( CenterCircleDots, event )
								return 
							else
								CenterCircleDots:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								CenterCircleDots:setAlpha( 1 )
								CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame5 )
							end
						end
						
						if event.interrupted then
							CenterCircleDotsFrame4( CenterCircleDots, event )
							return 
						else
							CenterCircleDots:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							CenterCircleDots:setAlpha( 0 )
							CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame4 )
						end
					end
					
					if event.interrupted then
						CenterCircleDotsFrame3( CenterCircleDots, event )
						return 
					else
						CenterCircleDots:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						CenterCircleDots:setAlpha( 1 )
						CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame3 )
					end
				end
				
				CenterCircleDots:completeAnimation()
				self.CenterCircleDots:setAlpha( 0 )
				CenterCircleDotsFrame2( CenterCircleDots, {} )
				local CenterCircleDots0Frame2 = function ( CenterCircleDots0, event )
					local CenterCircleDots0Frame3 = function ( CenterCircleDots0, event )
						local CenterCircleDots0Frame4 = function ( CenterCircleDots0, event )
							local CenterCircleDots0Frame5 = function ( CenterCircleDots0, event )
								if not event.interrupted then
									CenterCircleDots0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
								end
								CenterCircleDots0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CenterCircleDots0, event )
								else
									CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CenterCircleDots0Frame5( CenterCircleDots0, event )
								return 
							else
								CenterCircleDots0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								CenterCircleDots0:setAlpha( 1 )
								CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame5 )
							end
						end
						
						if event.interrupted then
							CenterCircleDots0Frame4( CenterCircleDots0, event )
							return 
						else
							CenterCircleDots0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							CenterCircleDots0:setAlpha( 0 )
							CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame4 )
						end
					end
					
					if event.interrupted then
						CenterCircleDots0Frame3( CenterCircleDots0, event )
						return 
					else
						CenterCircleDots0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						CenterCircleDots0:setAlpha( 1 )
						CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame3 )
					end
				end
				
				CenterCircleDots0:completeAnimation()
				self.CenterCircleDots0:setAlpha( 0 )
				CenterCircleDots0Frame2( CenterCircleDots0, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Scanning = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		PossibleMatch = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Failed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
