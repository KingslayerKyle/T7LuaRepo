-- 6b0f35792b46e4bec6b3304658acb980
-- This hash is used for caching, delete to decompile the file again

CoD.vtolTarget = InheritFrom( LUI.UIElement )
CoD.vtolTarget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vtolTarget )
	self.id = "vtolTarget"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local UpperTriangle = LUI.UIImage.new()
	UpperTriangle:setLeftRight( true, false, 576, 704 )
	UpperTriangle:setTopBottom( true, false, -56, 72 )
	UpperTriangle:setAlpha( 0 )
	UpperTriangle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_target_triangle" ) )
	self:addElement( UpperTriangle )
	self.UpperTriangle = UpperTriangle
	
	local LeftTriangle = LUI.UIImage.new()
	LeftTriangle:setLeftRight( true, false, -54, 74 )
	LeftTriangle:setTopBottom( true, false, 640, 768 )
	LeftTriangle:setAlpha( 0 )
	LeftTriangle:setZRot( 120 )
	LeftTriangle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_target_triangle" ) )
	self:addElement( LeftTriangle )
	self.LeftTriangle = LeftTriangle
	
	local RightTriangle = LUI.UIImage.new()
	RightTriangle:setLeftRight( true, false, 1206, 1334 )
	RightTriangle:setTopBottom( true, false, 640, 768 )
	RightTriangle:setAlpha( 0 )
	RightTriangle:setZRot( -120 )
	RightTriangle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_target_triangle" ) )
	self:addElement( RightTriangle )
	self.RightTriangle = RightTriangle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				UpperTriangle:completeAnimation()
				self.UpperTriangle:setAlpha( 0 )
				self.clipFinished( UpperTriangle, {} )

				LeftTriangle:completeAnimation()
				self.LeftTriangle:setAlpha( 0 )
				self.clipFinished( LeftTriangle, {} )

				RightTriangle:completeAnimation()
				self.RightTriangle:setAlpha( 0 )
				self.clipFinished( RightTriangle, {} )
			end,
			NewTarget = function ()
				self:setupElementClipCounter( 3 )

				local UpperTriangleFrame2 = function ( UpperTriangle, event )
					if not event.interrupted then
						UpperTriangle:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
					end
					UpperTriangle:setLeftRight( true, false, 576, 704 )
					UpperTriangle:setTopBottom( true, false, 232, 360 )
					UpperTriangle:setAlpha( 1 )
					UpperTriangle:setScale( 0.25 )
					if event.interrupted then
						self.clipFinished( UpperTriangle, event )
					else
						UpperTriangle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UpperTriangle:completeAnimation()
				self.UpperTriangle:setLeftRight( true, false, 576, 704 )
				self.UpperTriangle:setTopBottom( true, false, -56, 72 )
				self.UpperTriangle:setAlpha( 0 )
				self.UpperTriangle:setScale( 1 )
				UpperTriangleFrame2( UpperTriangle, {} )
				local LeftTriangleFrame2 = function ( LeftTriangle, event )
					if not event.interrupted then
						LeftTriangle:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
					end
					LeftTriangle:setLeftRight( true, false, 512, 640 )
					LeftTriangle:setTopBottom( true, false, 360, 488 )
					LeftTriangle:setAlpha( 1 )
					LeftTriangle:setScale( 0.25 )
					if event.interrupted then
						self.clipFinished( LeftTriangle, event )
					else
						LeftTriangle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftTriangle:completeAnimation()
				self.LeftTriangle:setLeftRight( true, false, -54, 74 )
				self.LeftTriangle:setTopBottom( true, false, 640, 768 )
				self.LeftTriangle:setAlpha( 0 )
				self.LeftTriangle:setScale( 1 )
				LeftTriangleFrame2( LeftTriangle, {} )
				local RightTriangleFrame2 = function ( RightTriangle, event )
					if not event.interrupted then
						RightTriangle:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
					end
					RightTriangle:setLeftRight( true, false, 640, 768 )
					RightTriangle:setTopBottom( true, false, 360, 488 )
					RightTriangle:setAlpha( 1 )
					RightTriangle:setScale( 0.25 )
					if event.interrupted then
						self.clipFinished( RightTriangle, event )
					else
						RightTriangle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RightTriangle:completeAnimation()
				self.RightTriangle:setLeftRight( true, false, 1206, 1334 )
				self.RightTriangle:setTopBottom( true, false, 640, 768 )
				self.RightTriangle:setAlpha( 0 )
				self.RightTriangle:setScale( 1 )
				RightTriangleFrame2( RightTriangle, {} )
			end,
			LostTarget = function ()
				self:setupElementClipCounter( 3 )

				local UpperTriangleFrame2 = function ( UpperTriangle, event )
					if not event.interrupted then
						UpperTriangle:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
					end
					UpperTriangle:setLeftRight( true, false, 576, 704 )
					UpperTriangle:setTopBottom( true, false, -56, 72 )
					UpperTriangle:setAlpha( 0 )
					UpperTriangle:setScale( 1 )
					if event.interrupted then
						self.clipFinished( UpperTriangle, event )
					else
						UpperTriangle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UpperTriangle:completeAnimation()
				self.UpperTriangle:setLeftRight( true, false, 576, 704 )
				self.UpperTriangle:setTopBottom( true, false, 232, 360 )
				self.UpperTriangle:setAlpha( 1 )
				self.UpperTriangle:setScale( 0.25 )
				UpperTriangleFrame2( UpperTriangle, {} )
				local LeftTriangleFrame2 = function ( LeftTriangle, event )
					if not event.interrupted then
						LeftTriangle:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
					end
					LeftTriangle:setLeftRight( true, false, -54, 74 )
					LeftTriangle:setTopBottom( true, false, 640, 768 )
					LeftTriangle:setAlpha( 0 )
					LeftTriangle:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LeftTriangle, event )
					else
						LeftTriangle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftTriangle:completeAnimation()
				self.LeftTriangle:setLeftRight( true, false, 512, 640 )
				self.LeftTriangle:setTopBottom( true, false, 360, 488 )
				self.LeftTriangle:setAlpha( 1 )
				self.LeftTriangle:setScale( 0.25 )
				LeftTriangleFrame2( LeftTriangle, {} )
				local RightTriangleFrame2 = function ( RightTriangle, event )
					if not event.interrupted then
						RightTriangle:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
					end
					RightTriangle:setLeftRight( true, false, 1206, 1334 )
					RightTriangle:setTopBottom( true, false, 640, 768 )
					RightTriangle:setAlpha( 0 )
					RightTriangle:setScale( 1 )
					if event.interrupted then
						self.clipFinished( RightTriangle, event )
					else
						RightTriangle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RightTriangle:completeAnimation()
				self.RightTriangle:setLeftRight( true, false, 640, 768 )
				self.RightTriangle:setTopBottom( true, false, 360, 488 )
				self.RightTriangle:setAlpha( 1 )
				self.RightTriangle:setScale( 0.25 )
				RightTriangleFrame2( RightTriangle, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
