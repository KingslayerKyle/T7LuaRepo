require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.AttachmentInfoProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.AttachmentInfoFireRateProto" )

local UpdateAttachmentInfo = function ( self, event )
	self:playClip( "DefaultClip" )
end

local PostLoadFunc = function ( self, controller, menu )
	self.UpdateAttachmentInfo = UpdateAttachmentInfo
end

CoD.FireRateProto = InheritFrom( LUI.UIElement )
CoD.FireRateProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FireRateProto )
	self.id = "FireRateProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 316 )
	self:setTopBottom( true, false, 0, 18 )
	self.anyChildUsesUpdateState = true
	
	local AttachmentInfo = CoD.AttachmentInfoProto.new( menu, controller )
	AttachmentInfo:setLeftRight( false, true, -296, 0 )
	AttachmentInfo:setTopBottom( false, true, -18, 0 )
	AttachmentInfo:setRGB( 1, 1, 1 )
	self:addElement( AttachmentInfo )
	self.AttachmentInfo = AttachmentInfo
	
	local AttachmentInfoFireRate = CoD.AttachmentInfoFireRateProto.new( menu, controller )
	AttachmentInfoFireRate:setLeftRight( false, true, -292, 4 )
	AttachmentInfoFireRate:setTopBottom( false, true, -18, 0 )
	AttachmentInfoFireRate:setRGB( 1, 1, 1 )
	AttachmentInfoFireRate:setAlpha( 0 )
	self:addElement( AttachmentInfoFireRate )
	self.AttachmentInfoFireRate = AttachmentInfoFireRate
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local AttachmentInfoFrame2 = function ( AttachmentInfo, event )
					local AttachmentInfoFrame3 = function ( AttachmentInfo, event )
						if not event.interrupted then
							AttachmentInfo:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
						end
						AttachmentInfo:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( AttachmentInfo, event )
						else
							AttachmentInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AttachmentInfoFrame3( AttachmentInfo, event )
						return 
					else
						AttachmentInfo:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						AttachmentInfo:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFrame3 )
					end
				end
				
				AttachmentInfo:completeAnimation()
				self.AttachmentInfo:setAlpha( 1 )
				AttachmentInfoFrame2( AttachmentInfo, {} )
				local AttachmentInfoFireRateFrame2 = function ( AttachmentInfoFireRate, event )
					local AttachmentInfoFireRateFrame3 = function ( AttachmentInfoFireRate, event )
						if not event.interrupted then
							AttachmentInfoFireRate:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
						end
						AttachmentInfoFireRate:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( AttachmentInfoFireRate, event )
						else
							AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AttachmentInfoFireRateFrame3( AttachmentInfoFireRate, event )
						return 
					else
						AttachmentInfoFireRate:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						AttachmentInfoFireRate:registerEventHandler( "transition_complete_keyframe", AttachmentInfoFireRateFrame3 )
					end
				end
				
				AttachmentInfoFireRate:completeAnimation()
				self.AttachmentInfoFireRate:setAlpha( 0 )
				AttachmentInfoFireRateFrame2( AttachmentInfoFireRate, {} )
			end
		},
		NoAttachments = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				AttachmentInfo:completeAnimation()
				self.AttachmentInfo:setAlpha( 0 )
				self.clipFinished( AttachmentInfo, {} )
				AttachmentInfoFireRate:completeAnimation()
				self.AttachmentInfoFireRate:setAlpha( 1 )
				self.clipFinished( AttachmentInfoFireRate, {} )
			end
		}
	}
	self.close = function ( self )
		self.AttachmentInfo:close()
		self.AttachmentInfoFireRate:close()
		CoD.FireRateProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

