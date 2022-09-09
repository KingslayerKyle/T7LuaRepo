-- 0c9f2a23b41ee83baaccff7d59b8a6d4
-- This hash is used for caching, delete to decompile the file again

CoD.CP_Prologue_FaceScannerFoundBox = InheritFrom( LUI.UIElement )
CoD.CP_Prologue_FaceScannerFoundBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CP_Prologue_FaceScannerFoundBox )
	self.id = "CP_Prologue_FaceScannerFoundBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 191 )
	self:setTopBottom( true, false, 0, 238 )
	
	local FoundBox = LUI.UIImage.new()
	FoundBox:setLeftRight( true, false, 0, 190.5 )
	FoundBox:setTopBottom( true, false, 0, 238 )
	FoundBox:setRGB( 0, 0.31, 0.47 )
	FoundBox:setAlpha( 0.15 )
	FoundBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FoundBox )
	self.FoundBox = FoundBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local FoundBoxFrame2 = function ( FoundBox, event )
					local FoundBoxFrame3 = function ( FoundBox, event )
						if not event.interrupted then
							FoundBox:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
						end
						FoundBox:setAlpha( 0.15 )
						if event.interrupted then
							self.clipFinished( FoundBox, event )
						else
							FoundBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FoundBoxFrame3( FoundBox, event )
						return 
					else
						FoundBox:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						FoundBox:setAlpha( 0 )
						FoundBox:registerEventHandler( "transition_complete_keyframe", FoundBoxFrame3 )
					end
				end
				
				FoundBox:completeAnimation()
				self.FoundBox:setAlpha( 0.15 )
				FoundBoxFrame2( FoundBox, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Scanning = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FoundBox:completeAnimation()
				self.FoundBox:setAlpha( 0.15 )
				self.clipFinished( FoundBox, {} )
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
