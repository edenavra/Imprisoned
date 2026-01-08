using JellyGame.GamePlay.Managers;
using UnityEngine;

namespace JellyGame.GamePlay.Painting.Trails.Visibility
{
    public class TrailGenerationManager : MonoBehaviour
    {
        public static float CurrentGeneration { get; private set; } = 0f;

        private void OnEnable()
        {
            EventManager.StartListening(EventManager.GameEvent.OnShapeClosed, HandleShapeClosed);
        }

        private void OnDisable()
        {
            EventManager.StopListening(EventManager.GameEvent.OnShapeClosed, HandleShapeClosed);
        }

        private void HandleShapeClosed(object sender)
        {
            AdvanceGeneration();
        }

        public static void AdvanceGeneration()
        {
            CurrentGeneration += 1f;
            Debug.Log($"[TrailGeneration] Advanced to {CurrentGeneration}");
        }
    }
}