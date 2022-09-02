-- 3d8fbfd29f2bd8b76911e01c507c366b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMBuildables.BuildableIcon" )

CoD.QuestItemList = InheritFrom( LUI.UIElement )
CoD.QuestItemList.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.QuestItemList )
	self.id = "QuestItemList"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 308 )
	self:setTopBottom( true, false, 0, 48 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local questList = LUI.UIList.new( menu, controller, 4, 0, nil, false, false, 0, 0, false, true )
	questList:makeFocusable()
	questList:setLeftRight( true, false, 0, 308 )
	questList:setTopBottom( true, false, 0, 48 )
	questList:setWidgetType( CoD.BuildableIcon )
	questList:setHorizontalCount( 6 )
	questList:setSpacing( 4 )
	self:addElement( questList )
	self.questList = questList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				questList:completeAnimation()
				self.questList:setAlpha( 0 )
				self.clipFinished( questList, {} )
			end,
			ItemPickUp = function ()
				self:setupElementClipCounter( 1 )

				local questListFrame2 = function ( questList, event )
					local questListFrame3 = function ( questList, event )
						local questListFrame4 = function ( questList, event )
							if not event.interrupted then
								questList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							end
							questList:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( questList, event )
							else
								questList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							questListFrame4( questList, event )
							return 
						else
							questList:beginAnimation( "keyframe", 4000, false, false, CoD.TweenType.Linear )
							questList:registerEventHandler( "transition_complete_keyframe", questListFrame4 )
						end
					end
					
					if event.interrupted then
						questListFrame3( questList, event )
						return 
					else
						questList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						questList:setAlpha( 1 )
						questList:registerEventHandler( "transition_complete_keyframe", questListFrame3 )
					end
				end
				
				questList:completeAnimation()
				self.questList:setAlpha( 0 )
				questListFrame2( questList, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				questList:completeAnimation()
				self.questList:setAlpha( 1 )
				self.clipFinished( questList, {} )
			end
		}
	}
	questList.id = "questList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.questList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.questList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

